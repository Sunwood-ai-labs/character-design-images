---
name: character-design-images
description: Use when selecting, using, referencing, generating, drawing, or placing character design images, character sheets, mascots, manga/game/anime characters, avatars, thumbnails, or visual assets where an existing character should be reused before searching or generating new art.
---

# Character Design Images

## Overview

This skill makes `/Users/admin/Prj/character-design-images` the first source to check when a task needs a character design, character sheet, avatar, mascot, manga/game/anime character, or reusable visual character asset.

Core rule: prefer the existing character assets in this repository before searching the web or generating a new character, unless the user explicitly asks for something new.

## Workflow

1. Start from the repository:

   ```sh
   cd /Users/admin/Prj/character-design-images
   ```

2. Read `metadata/characters.csv` to find available characters, names, usage scope, and asset paths.
3. Use `assets/exports/<character-id>/` for full character sheets and `assets/thumbnails/<character-id>/` for gallery previews.
4. If the user names a character, match by `character_id` or `name`. If the user asks generally for "a character", "キャラクター", "アバター", "マスコット", or similar, review the catalog first and suggest the closest existing candidate.
5. Only use web search or image generation for a new character after confirming the repository has no suitable match, or when the user explicitly requests new art.
6. When editing this repository, follow `AGENTS.md`: verify, commit, and push every meaningful change.

## Catalog

| ID | Name | Default Export |
| --- | --- | --- |
| `ayano-yukimura` | Ayano Yukimura | `assets/exports/ayano-yukimura/ayano-yukimura_default_character-sheet_v001.jpeg` |
| `fuhyo` | Fuhyo | `assets/exports/fuhyo/fuhyo_default_character-sheet_v001.png` |
| `hisha` | Hisha | `assets/exports/hisha/hisha_default_character-sheet_v001.png` |
| `kakugyo` | Kakugyo | `assets/exports/kakugyo/kakugyo_default_character-sheet_v001.png` |
| `kohaku` | Kohaku | `assets/exports/kohaku/kohaku_default_character-sheet_v001.png` |
| `maki` | Maki | `assets/exports/maki/maki_default_character-sheet_v001.png` |
| `momiji` | Momiji | `assets/exports/momiji/momiji_default_character-sheet_v001.png` |
| `onizuka` | Onizuka | `assets/exports/onizuka/onizuka_default_character-sheet_v001.jpeg` |

## Quick Commands

List character records:

```sh
awk -F, 'NR > 1 {print $1 " - " $2 " - " $11}' metadata/characters.csv
```

List generated Codex pet packages:

```sh
awk -F, 'NR > 1 {print $1 " - " $3 " - " $9}' metadata/pets.csv
```

Regenerate README-friendly pet animation previews. By default, this plays every sprite-sheet row in manifest order:

```sh
./scripts/generate-web-previews.py
```

Open the repository gallery:

```sh
open README.md
```

Validate repository and skill wiring:

```sh
./scripts/validate-assets.sh
./scripts/validate-skill.sh
```

## Usage Guidance

- For websites, apps, decks, README galleries, or mockups, prefer `assets/thumbnails/` for compact previews and link to the matching `assets/exports/` file.
- For Codex pet reuse, use `metadata/pets.csv` and `assets/pets/<character-id>/`. Each pet folder contains installable `pet.json` and `spritesheet.webp` files plus extracted frames, all-state WebP animation previews under `preview/`, QA contact sheet, frame review, and atlas validation.
- For image-generation or illustration tasks, inspect the relevant character sheet first, then use it as the visual reference when the image tool supports references. If the tool cannot take image references, summarize the visible design traits from the sheet and say that the prompt is derived from this repository.
- Treat `metadata/characters.csv` and `RIGHTS.md` as the source of truth for rights and usage scope. Current records are `unknown` and `internal-review`, so do not claim commercial or redistribution rights unless the user updates the metadata.
- Keep public preview files in `assets/exports/`, `assets/thumbnails/`, and `assets/pets/` as normal Git blobs so GitHub can render them. Reserve Git LFS for `assets/originals/`, `assets/references/`, source files, and archives.

## Common Mistakes

- Do not invent a new character when an existing repository character fits the request.
- Do not leave newly imported images at the repository root.
- Do not move public preview images into LFS unless the user asks for storage optimization over GitHub preview quality.
- Do not use a character publicly without checking the metadata usage scope.
