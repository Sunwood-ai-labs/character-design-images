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

test -L "$install_link"
test "$(readlink "$install_link")" = "$repo_root"

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

echo "character-design-images skill looks ready."
