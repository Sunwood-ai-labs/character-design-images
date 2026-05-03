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


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate README-friendly animated WebP previews for pet packages."
    )
    parser.add_argument(
        "--state",
        default="all",
        help="Frame state to animate, or 'all' to play every sprite-sheet row.",
    )
    parser.add_argument(
        "--duration-ms",
        type=int,
        default=100,
        help="Frame duration in milliseconds.",
    )
    parser.add_argument(
        "--quality",
        type=int,
        default=82,
        help="Animated WebP quality, 1-100.",
    )
    return parser.parse_args()


def choose_rows(rows: list[dict[str, object]], state: str) -> list[dict[str, object]]:
    if state == "all":
        return rows

    by_state = {str(row["state"]): row for row in rows}
    if state in by_state:
        return [by_state[state]]

    available = ", ".join(sorted(by_state))
    raise ValueError(f"frame state '{state}' not found; available states: {available}")


def load_row_frames(root: Path, frame_paths: list[str]) -> list[Image.Image]:
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


def load_preview_frames(root: Path, rows: list[dict[str, object]]) -> list[Image.Image]:
    frames: list[Image.Image] = []
    for row in rows:
        frames.extend(load_row_frames(root, row["frames"]))
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
        frame_rows = choose_rows(manifest["rows"], args.state)
        frames = load_preview_frames(root, frame_rows)

        frames[0].save(
            preview_path,
            format="WEBP",
            save_all=True,
            append_images=frames[1:],
            duration=args.duration_ms,
            loop=0,
            lossless=False,
            quality=args.quality,
            alpha_quality=90,
            method=6,
            disposal=2,
            background=(0, 0, 0, 0),
        )
        assert_animated_webp(preview_path)
        states = ", ".join(str(row["state"]) for row in frame_rows)
        print(
            f"{character_id}: wrote {preview_path.relative_to(root)} "
            f"from {states} ({len(frames)} frames)"
        )


if __name__ == "__main__":
    main()
