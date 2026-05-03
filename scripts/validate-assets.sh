#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

git lfs version >/dev/null
tracked_patterns="$(git lfs track)"
grep -Fq 'assets/originals/**' <<<"$tracked_patterns"
grep -Fq 'assets/references/**' <<<"$tracked_patterns"
test -f metadata/characters.csv
test -d assets/originals
test -d assets/exports
test -d assets/pets
test -d assets/references
test -d assets/thumbnails
test -f metadata/pets.csv

python3 - <<'PY'
import csv
import json
from pathlib import Path

try:
    from PIL import Image
except ImportError as exc:
    raise SystemExit("Pillow is required to validate animated WebP previews") from exc

root = Path.cwd()
pets_csv = root / "metadata" / "pets.csv"

with pets_csv.open(newline="", encoding="utf-8") as handle:
    rows = list(csv.DictReader(handle))

required_columns = {
    "character_id",
    "pet_id",
    "display_name",
    "package_path",
    "manifest_path",
    "spritesheet_path",
    "frames_path",
    "contact_sheet_path",
    "validation_path",
    "review_path",
}
missing_columns = required_columns.difference(rows[0].keys() if rows else set())
if missing_columns:
    raise SystemExit(f"metadata/pets.csv missing columns: {sorted(missing_columns)}")

for row in rows:
    pet_id = row["pet_id"]
    for key in [
        "package_path",
        "manifest_path",
        "spritesheet_path",
        "frames_path",
        "contact_sheet_path",
        "validation_path",
        "review_path",
    ]:
        path = root / row[key]
        if not path.exists():
            raise SystemExit(f"{pet_id}: {key} does not exist: {row[key]}")

    manifest = json.loads((root / row["manifest_path"]).read_text(encoding="utf-8"))
    if manifest.get("id") != pet_id:
        raise SystemExit(f"{pet_id}: manifest id mismatch")
    if manifest.get("spritesheetPath") != Path(row["spritesheet_path"]).name:
        raise SystemExit(f"{pet_id}: spritesheetPath mismatch")

    validation = json.loads((root / row["validation_path"]).read_text(encoding="utf-8"))
    if validation.get("ok") is not True:
        raise SystemExit(f"{pet_id}: validation is not ok")

    review = json.loads((root / row["review_path"]).read_text(encoding="utf-8"))
    if review.get("ok") is not True:
        raise SystemExit(f"{pet_id}: frame review is not ok")

    preview_path = (
        root
        / row["package_path"]
        / "preview"
        / f"{row['character_id']}_{row['variant']}_pet-preview_{row['version']}.webp"
    )
    if not preview_path.exists():
        raise SystemExit(f"{pet_id}: preview animation does not exist: {preview_path.relative_to(root)}")

    preview_bytes = preview_path.read_bytes()
    if (
        preview_bytes[:4] != b"RIFF"
        or preview_bytes[8:12] != b"WEBP"
        or b"ANIM" not in preview_bytes
    ):
        raise SystemExit(f"{pet_id}: preview is not an animated WebP: {preview_path.relative_to(root)}")

    frames_manifest = json.loads((root / row["frames_path"] / "frames-manifest.json").read_text(encoding="utf-8"))
    expected_frame_count = 0
    for frame_row in frames_manifest["rows"]:
        frame_count = len(frame_row["frames"])
        expected_frame_count += frame_count if frame_count <= 2 else frame_count + frame_count - 2

    with Image.open(preview_path) as preview:
        actual_frame_count = getattr(preview, "n_frames", 1)

    if actual_frame_count != expected_frame_count:
        raise SystemExit(
            f"{pet_id}: preview frame count {actual_frame_count} "
            f"does not cover all sprite states ({expected_frame_count})"
        )
PY

echo "character-design-images repository looks ready."
