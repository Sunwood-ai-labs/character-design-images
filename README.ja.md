<div align="center">
  <img src="docs/public/logo.svg" width="96" alt="Character Design Images logo">
  <h1>Character Design Images</h1>
  <p>再利用しやすいキャラクターシート、権利メタデータ、Codex pet package を整理する公開カタログです。</p>

  <p>
    <a href="README.md">English</a>
    ·
    <a href="README.ja.md">日本語</a>
    ·
    <a href="https://sunwood-ai-labs.github.io/character-design-images/">Documentation</a>
  </p>

  <p>
    <a href="https://github.com/Sunwood-ai-labs/character-design-images/actions/workflows/ci.yml"><img src="https://github.com/Sunwood-ai-labs/character-design-images/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
    <a href="https://github.com/Sunwood-ai-labs/character-design-images/actions/workflows/pages.yml"><img src="https://github.com/Sunwood-ai-labs/character-design-images/actions/workflows/pages.yml/badge.svg" alt="Pages deployment status"></a>
    <img src="https://img.shields.io/badge/Codex_Skill-ready-2563eb" alt="Codex Skill ready">
    <a href="RIGHTS.md"><img src="https://img.shields.io/badge/license-see_RIGHTS.md-lightgrey" alt="License and rights are documented in RIGHTS.md"></a>
  </p>
</div>

## 概要

このリポジトリは、キャラクターデザインシートの公開プレビュー、README 用サムネイル、検索しやすいメタデータ、生成済み Codex pet package を保管します。

新しいアバター、マスコット、漫画・ゲーム向けキャラクター、資料用イラスト、Web ビジュアル、Codex pet を作る前に、既存キャラクターの参照元として使う想定です。各画像の出典、権利状態、利用範囲、ファイルパス、補足は `metadata/characters.csv` に記録します。

現在の権利レコードは `unknown` / `internal-review` です。メタデータが更新されるまでは、商用利用や外部再配布が可能な素材として扱わないでください。

## キャラクターギャラリー

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

## Codex Pet Packages

生成済み Codex pet package は `assets/pets/<character-id>/` にあります。各フォルダには、インストール用の `pet.json` と `spritesheet.webp`、抽出フレーム、contact sheet、frame review、atlas validation、README 用 animated WebP preview を置いています。検索用の一覧は `metadata/pets.csv` です。

animated preview の再生成:

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

## ディレクトリ構成

```text
assets/
  originals/   # 元データ、ラフ、PSD/CLIP/Procreate など
  exports/     # 共有・確認用の公開 character sheet export
  pets/        # Codex pet packages, frames, previews, QA, validation
  references/  # 参考画像、ムードボード、外部資料
  thumbnails/  # README / docs 用の軽量サムネイル
metadata/
  characters.csv
  pets.csv
docs/
  .vitepress/
  ja/
  naming.md
```

## Codex Skill

このリポジトリは Codex Skill としてローカルにインストールされています。

```text
/Users/admin/.codex/skills/character-design-images -> /Users/admin/Prj/character-design-images
```

キャラクターシート、アバター、マスコット、漫画・ゲーム・アニメ風キャラクター、再利用可能なビジュアル素材が必要なタスクでは、Codex は Web 検索や新規生成の前にこのリポジトリを確認します。カタログを更新したら、`SKILL.md` と `metadata/characters.csv` を必ず揃えてください。

## ローカル QA

アセット、メタデータ、ドキュメント、workflow、skill を更新したら、commit 前に次を実行します。

```sh
./scripts/validate-assets.sh
./scripts/validate-skill.sh
git diff --check
awk -F, 'NR == 1 {next} NF != 12 {print "bad field count", NR, NF, $0; bad=1} END {exit bad}' metadata/characters.csv
git lfs ls-files
npm run docs:build
```

`git lfs ls-files` は通常空です。`assets/originals/` や `assets/references/` に大きな元データを意図的に追加した場合だけ、LFS tracked file が出る想定です。

## 画像追加手順

1. 用途に合う `assets/` 配下へ画像を追加します。
2. `metadata/characters.csv` にキャラクター名、variant、権利状態、利用範囲、画像パスを記録します。
3. [docs/naming.md](docs/naming.md) の命名規則に合わせます。
4. 公開 character sheet export は `assets/exports/<character-id>/` に置きます。
5. README gallery thumbnail は `assets/thumbnails/<character-id>/` に置きます。
6. 大きな元データや reference bundle は、Git LFS 管理の `assets/originals/` または `assets/references/` に置きます。

Codex pet package を追加・更新する場合は `assets/pets/<character-id>/` に package と QA 一式を置き、`metadata/pets.csv` を更新します。

## 権利

このリポジトリは、画像や pet package に対して一括ライセンスを付与しません。公開利用、商用利用、再配布、生成物への派生利用の前に、`metadata/characters.csv`、`metadata/pets.csv`、[RIGHTS.md](RIGHTS.md)、[LICENSE](LICENSE) を確認してください。
