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

## Directory Layout

```text
assets/
  originals/   # 元データ、ラフ、PSD/CLIP/Procreate など
  exports/     # PNG/JPEG/WebP など共有・確認用の書き出し
  references/  # 参考画像、ムードボード、外部資料
  thumbnails/  # 一覧確認用の軽量サムネイル
metadata/
  characters.csv
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

```sh
git status --short
git add assets metadata
git commit -m "Add <character-name> design images"
```

## Rights

このリポジトリ全体に一括ライセンスは設定していません。各画像の利用可否は `metadata/characters.csv` と `RIGHTS.md` を確認してください。
