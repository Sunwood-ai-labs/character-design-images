#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

git lfs version >/dev/null
tracked_patterns="$(git lfs track)"
grep -Fq '*.png' <<<"$tracked_patterns"
test -f metadata/characters.csv
test -d assets/originals
test -d assets/exports
test -d assets/references
test -d assets/thumbnails

echo "character-design-images repository looks ready."
