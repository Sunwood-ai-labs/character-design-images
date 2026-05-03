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
PY

echo "character-design-images repository looks ready."
