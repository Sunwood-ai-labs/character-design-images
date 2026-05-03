# Naming

Use lowercase English letters, numbers, and hyphens so files stay easy to search, sort, and link from Markdown.

## Pattern

```text
<character-id>_<variant>_<view>_<version>.<ext>
```

For character sheets, prefer:

```text
<character-id>_default_character-sheet_v001.<ext>
```

## Examples

```text
akari_default_character-sheet_v001.png
akari_default_turnaround_v002.psd
akari_winter-costume_fullbody_v001.webp
```

## Fields

- `character-id`: Stable character identifier, such as `akari`, `ren`, or `mika`
- `variant`: Costume or state, such as `default`, `winter-costume`, or `battle`
- `view`: Asset view, such as `front`, `side`, `back`, `fullbody`, `portrait`, `turnaround`, or `character-sheet`
- `version`: Start at `v001` and increment when replacing or revising an asset

## Placement

- Public character-sheet exports belong in `assets/exports/<character-id>/`.
- README and docs thumbnails belong in `assets/thumbnails/<character-id>/`.
- Large source files belong in `assets/originals/`.
- Reference bundles belong in `assets/references/`.
- Codex pet packages belong in `assets/pets/<character-id>/`.

## Codex Pet Packages

Codex pet packages are stored as runnable folders under:

```text
assets/pets/<character-id>/
```

Each package intentionally keeps the Codex runtime filenames:

```text
pet.json
spritesheet.webp
```

Supporting QA files live in subfolders:

```text
frames/<state>/<frame-index>.png
preview/<character-id>_<variant>_pet-preview_<version>.webp
final/validation.json
qa/contact-sheet.png
qa/review.json
qa/run-summary.json
```

The searchable index for pet packages is `metadata/pets.csv`.
