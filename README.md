# Character Design Images

キャラクターデザイン画像を整理して保管するためのリポジトリです。原画、書き出し画像、参考画像、サムネイルを分けて置き、各画像の権利・用途・状態は `metadata/characters.csv` に記録します。

## Gallery

| Character | Preview | Export |
| --- | --- | --- |
| Ayano Yukimura | <img src="assets/thumbnails/ayano-yukimura/ayano-yukimura_default_character-sheet_v001.jpg" width="180" alt="Ayano Yukimura"> | [character sheet](assets/exports/ayano-yukimura/ayano-yukimura_default_character-sheet_v001.jpeg) |
| Fuhyo | <img src="assets/thumbnails/fuhyo/fuhyo_default_character-sheet_v001.jpg" width="180" alt="Fuhyo"> | [character sheet](assets/exports/fuhyo/fuhyo_default_character-sheet_v001.png) |
| Hisha | <img src="assets/thumbnails/hisha/hisha_default_character-sheet_v001.jpg" width="180" alt="Hisha"> | [character sheet](assets/exports/hisha/hisha_default_character-sheet_v001.png) |
| Kakugyo | <img src="assets/thumbnails/kakugyo/kakugyo_default_character-sheet_v001.jpg" width="180" alt="Kakugyo"> | [character sheet](assets/exports/kakugyo/kakugyo_default_character-sheet_v001.png) |
| Kohaku | <img src="assets/thumbnails/kohaku/kohaku_default_character-sheet_v001.jpg" width="180" alt="Kohaku"> | [character sheet](assets/exports/kohaku/kohaku_default_character-sheet_v001.png) |
| Maki | <img src="assets/thumbnails/maki/maki_default_character-sheet_v001.jpg" width="180" alt="Maki"> | [character sheet](assets/exports/maki/maki_default_character-sheet_v001.png) |
| Momiji | <img src="assets/thumbnails/momiji/momiji_default_character-sheet_v001.jpg" width="180" alt="Momiji"> | [character sheet](assets/exports/momiji/momiji_default_character-sheet_v001.png) |
| Onizuka | <img src="assets/thumbnails/onizuka/onizuka_default_character-sheet_v001.jpg" width="180" alt="Onizuka"> | [character sheet](assets/exports/onizuka/onizuka_default_character-sheet_v001.jpeg) |

## Pet Assets

Codex pet packages generated from the current character designs are stored under `assets/pets/<character-id>/`. Each folder keeps the installable `pet.json` + `spritesheet.webp` pair, extracted frames, contact sheet, frame review, and atlas validation output. The index is `metadata/pets.csv`.

Animated WebP previews play every sprite-sheet row from the pet frame manifest and are kept under `assets/pets/<character-id>/preview/` so GitHub can render them directly in this README. Regenerate them with:

```sh
./scripts/generate-web-previews.py
```

| Character | Web Preview | Pet QA | Package |
| --- | --- | --- | --- |
| Ayano Yukimura | <img src="assets/pets/ayano-yukimura/preview/ayano-yukimura_default_pet-preview_v001.webp" width="96" alt="Ayano Yukimura pet animation preview"> | <img src="assets/pets/ayano-yukimura/qa/contact-sheet.png" width="180" alt="Ayano Yukimura pet contact sheet"> | [pet package](assets/pets/ayano-yukimura/) |
| Fuhyo | <img src="assets/pets/fuhyo/preview/fuhyo_default_pet-preview_v001.webp" width="96" alt="Fuhyo pet animation preview"> | <img src="assets/pets/fuhyo/qa/contact-sheet.png" width="180" alt="Fuhyo pet contact sheet"> | [pet package](assets/pets/fuhyo/) |
| Hisha | <img src="assets/pets/hisha/preview/hisha_default_pet-preview_v001.webp" width="96" alt="Hisha pet animation preview"> | <img src="assets/pets/hisha/qa/contact-sheet.png" width="180" alt="Hisha pet contact sheet"> | [pet package](assets/pets/hisha/) |
| Kakugyo | <img src="assets/pets/kakugyo/preview/kakugyo_default_pet-preview_v001.webp" width="96" alt="Kakugyo pet animation preview"> | <img src="assets/pets/kakugyo/qa/contact-sheet.png" width="180" alt="Kakugyo pet contact sheet"> | [pet package](assets/pets/kakugyo/) |
| Kohaku | <img src="assets/pets/kohaku/preview/kohaku_default_pet-preview_v001.webp" width="96" alt="Kohaku pet animation preview"> | <img src="assets/pets/kohaku/qa/contact-sheet.png" width="180" alt="Kohaku pet contact sheet"> | [pet package](assets/pets/kohaku/) |
| Maki | <img src="assets/pets/maki/preview/maki_default_pet-preview_v001.webp" width="96" alt="Maki pet animation preview"> | <img src="assets/pets/maki/qa/contact-sheet.png" width="180" alt="Maki pet contact sheet"> | [pet package](assets/pets/maki/) |
| Momiji | <img src="assets/pets/momiji/preview/momiji_default_pet-preview_v001.webp" width="96" alt="Momiji pet animation preview"> | <img src="assets/pets/momiji/qa/contact-sheet.png" width="180" alt="Momiji pet contact sheet"> | [pet package](assets/pets/momiji/) |
| Onizuka | <img src="assets/pets/onizuka/preview/onizuka_default_pet-preview_v001.webp" width="96" alt="Onizuka pet animation preview"> | <img src="assets/pets/onizuka/qa/contact-sheet.png" width="180" alt="Onizuka pet contact sheet"> | [pet package](assets/pets/onizuka/) |

## Directory Layout

```text
assets/
  originals/   # 元データ、ラフ、PSD/CLIP/Procreate など
  exports/     # PNG/JPEG/WebP など共有・確認用の書き出し
  pets/        # Codex pet packages, extracted frames, web previews, QA, validation
  references/  # 参考画像、ムードボード、外部資料
  thumbnails/  # 一覧確認用の軽量サムネイル
metadata/
  characters.csv
  pets.csv
docs/
  naming.md
```

## Git LFS

原本、参考画像、大容量の制作ファイルは Git LFS で管理します。公開プレビューしやすい `assets/exports/` と `assets/thumbnails/` は通常の Git blob として保存します。初回だけ次を実行してください。

```sh
git lfs install
```

このリポジトリでは `.gitattributes` で `assets/originals/`、`assets/references/`、主要な制作ファイル形式、アーカイブ形式を LFS 対象にしています。

## Codex Skill

このリポジトリは Codex Skill としても使えます。キャラクター画像、キャラ設定、マスコット、アバター、漫画・ゲーム向けキャラ素材を使う作業では、まずこのリポジトリの `metadata/characters.csv` と `assets/exports/` を優先します。

ローカルでは次の symlink でインストールしています。

```text
/Users/admin/.codex/skills/character-design-images -> /Users/admin/Prj/character-design-images
```

## Adding Images

1. 画像を用途に合う `assets/` 配下へ追加します。
2. `metadata/characters.csv` にキャラクター名、バリアント、ライセンス、画像パスを追記します。
3. ファイル名は `docs/naming.md` のルールに合わせます。

Codex pet を追加・更新する場合は `assets/pets/<character-id>/` に package と QA 一式を置き、`metadata/pets.csv` を更新します。

```sh
git status --short
git add assets metadata
git commit -m "Add <character-name> design images"
```

## Rights

このリポジトリ全体に一括ライセンスは設定していません。各画像の利用可否は `metadata/characters.csv` と `RIGHTS.md` を確認してください。
