#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_file="$repo_root/SKILL.md"
install_link="/Users/admin/.codex/skills/character-design-images"

cd "$repo_root"

test -f "$skill_file"
grep -Fq "name: character-design-images" "$skill_file"
grep -Fq "description: Use when" "$skill_file"
grep -Fq "/Users/admin/Prj/character-design-images" "$skill_file"
grep -Fq "metadata/characters.csv" "$skill_file"
grep -Fq "assets/exports/" "$skill_file"
grep -Fq "assets/thumbnails/" "$skill_file"

if [ -e "$install_link" ] || [ -L "$install_link" ]; then
  test -L "$install_link"
  test "$(readlink "$install_link")" = "$repo_root"
elif [ "${CI:-}" != "true" ]; then
  echo "missing local skill symlink: $install_link" >&2
  exit 1
fi

awk -F, '
  NR == 1 { next }
  NF != 12 {
    print "bad field count", NR, NF, $0
    bad = 1
    next
  }
  {
    export_path = $11
    thumb_path = "assets/thumbnails/" $1 "/" $1 "_" $3 "_" $4 "_" $5 ".jpg"
    if (system("test -f " export_path) != 0) {
      print "missing export", NR, export_path
      bad = 1
    }
    if (system("test -f " thumb_path) != 0) {
      print "missing thumbnail", NR, thumb_path
      bad = 1
    }
  }
  END { exit bad }
' metadata/characters.csv

python3 - <<'PY'
import csv
import re
from pathlib import Path

root = Path.cwd()
skill = (root / "SKILL.md").read_text(encoding="utf-8")
with (root / "metadata" / "characters.csv").open(newline="", encoding="utf-8") as handle:
    rows = list(csv.DictReader(handle))

for row in rows:
    expected = [
        f"`{row['character_id']}`",
        f"| {row['name']} |",
        f"`{row['image_path']}`",
    ]
    for value in expected:
        if value not in skill:
            raise SystemExit(f"SKILL.md missing catalog value for {row['character_id']}: {value}")

catalog_rows = re.findall(r"^\| `[^`]+` \| [^|]+ \| `assets/exports/[^`]+` \|$", skill, re.MULTILINE)
if len(catalog_rows) != len(rows):
    raise SystemExit(
        f"SKILL.md catalog row count {len(catalog_rows)} does not match metadata/characters.csv {len(rows)}"
    )
PY

echo "character-design-images skill looks ready."
