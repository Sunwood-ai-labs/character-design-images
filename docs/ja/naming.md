# 命名規則

ファイル名は後から検索・並び替え・Markdown link 化しやすいように、英小文字、数字、ハイフンで揃えます。

## Pattern

```text
<character-id>_<variant>_<view>_<version>.<ext>
```

character sheet では次を優先します。

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

- `character-id`: キャラクター識別子。例: `akari`, `ren`, `mika`
- `variant`: 衣装や状態。例: `default`, `winter-costume`, `battle`
- `view`: 見た目の種類。例: `front`, `side`, `back`, `fullbody`, `portrait`, `turnaround`, `character-sheet`
- `version`: `v001` から始め、差し替えや更新時に番号を上げます

## 配置

- 公開 character sheet export は `assets/exports/<character-id>/` に置きます。
- README / docs 用 thumbnail は `assets/thumbnails/<character-id>/` に置きます。
- 大きな source file は `assets/originals/` に置きます。
- reference bundle は `assets/references/` に置きます。
- Codex pet package は `assets/pets/<character-id>/` に置きます。

## Codex Pet Packages

Codex pet package は runnable folder として次に保存します。

```text
assets/pets/<character-id>/
```

各 package は Codex runtime の file name をそのまま保持します。

```text
pet.json
spritesheet.webp
```

QA 用の補助 file は subfolder に置きます。

```text
frames/<state>/<frame-index>.png
preview/<character-id>_<variant>_pet-preview_<version>.webp
final/validation.json
qa/contact-sheet.png
qa/review.json
qa/run-summary.json
```

pet package の検索用 index は `metadata/pets.csv` です。
