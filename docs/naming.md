# Naming

ファイル名は後から検索しやすいように、英小文字、数字、ハイフンだけで揃えます。

## Pattern

```text
<character-id>_<variant>_<view>_<version>.<ext>
```

## Examples

```text
akari_default_front_v001.png
akari_default_turnaround_v002.psd
akari_winter_costume_fullbody_v001.webp
```

## Fields

- `character-id`: キャラクター識別子。例: `akari`, `ren`, `mika`
- `variant`: 衣装や状態。例: `default`, `winter-costume`, `battle`
- `view`: 見た目の種類。例: `front`, `side`, `back`, `fullbody`, `portrait`, `turnaround`
- `version`: `v001` から始め、差し替え時に番号を上げます。

## Notes

- スペース、日本語、記号はファイル名に使わず、説明は `metadata/characters.csv` に書きます。
- 同じキャラクターの画像は、可能ならキャラクターごとのサブフォルダにまとめます。
- 大きな元データは `assets/originals/`、確認用の軽い画像は `assets/exports/` に置きます。

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
