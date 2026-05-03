#!/usr/bin/env python3
"""Generate animated WebP preview files from Codex pet frame manifests."""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path

try:
    from PIL import Image
except ImportError as exc:  # pragma: no cover - exercised only on missing deps.
    raise SystemExit(
        "Pillow is required to generate animated WebP previews. "
        "Install it with `python3 -m pip install Pillow`."
    ) from exc


FALLBACK_STATES = ("waving", "idle", "waiting", "running")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate README-friendly animated WebP previews for pet packages."
    )
    parser.add_argument(
        "--state",
        default="waving",
        help="Preferred frame state to animate. Falls back to idle/waiting/running if absent.",
    )
    parser.add_argument(
        "--duration-ms",
        type=int,
        default=140,
        help="Frame duration in milliseconds.",
    )
    return parser.parse_args()


def choose_row(rows: list[dict[str, object]], preferred_state: str) -> dict[str, object]:
    by_state = {str(row["state"]): row for row in rows}
    for state in (preferred_state, *FALLBACK_STATES):
        if state in by_state:
            return by_state[state]
    available = ", ".join(sorted(by_state))
    raise ValueError(f"no previewable frame state found; available states: {available}")


def load_frames(root: Path, frame_paths: list[str]) -> list[Image.Image]:
    frames: list[Image.Image] = []
    for frame_path in frame_paths:
        path = root / frame_path
        with Image.open(path) as image:
            frames.append(image.convert("RGBA").copy())
    if len(frames) < 2:
        raise ValueError("animated preview requires at least two frames")
    if len(frames) > 2:
        frames = frames + frames[-2:0:-1]
    return frames


def assert_animated_webp(path: Path) -> None:
    data = path.read_bytes()
    if data[:4] != b"RIFF" or data[8:12] != b"WEBP" or b"ANIM" not in data:
        raise ValueError(f"{path} is not an animated WebP file")


def main() -> None:
    args = parse_args()
    root = Path(__file__).resolve().parents[1]
    pets_csv = root / "metadata" / "pets.csv"

    with pets_csv.open(newline="", encoding="utf-8") as handle:
        pets = list(csv.DictReader(handle))

    for pet in pets:
        character_id = pet["character_id"]
        preview_dir = root / pet["package_path"] / "preview"
        preview_dir.mkdir(parents=True, exist_ok=True)
        preview_path = (
            preview_dir
            / f"{character_id}_{pet['variant']}_pet-preview_{pet['version']}.webp"
        )

        frames_manifest_path = root / pet["frames_path"] / "frames-manifest.json"
        manifest = json.loads(frames_manifest_path.read_text(encoding="utf-8"))
        frame_row = choose_row(manifest["rows"], args.state)
        frames = load_frames(root, frame_row["frames"])

        frames[0].save(
            preview_path,
            format="WEBP",
            save_all=True,
            append_images=frames[1:],
            duration=args.duration_ms,
            loop=0,
            lossless=True,
            method=6,
            disposal=2,
            background=(0, 0, 0, 0),
        )
        assert_animated_webp(preview_path)
        print(
            f"{character_id}: wrote {preview_path.relative_to(root)} "
            f"from {frame_row['state']} ({len(frames)} frames)"
        )


if __name__ == "__main__":
    main()
