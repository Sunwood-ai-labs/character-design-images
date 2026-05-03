# Character Design Images

キャラクターデザイン画像を整理して保管するためのリポジトリです。原画、書き出し画像、参考画像、サムネイルを分けて置き、各画像の権利・用途・状態は `metadata/characters.csv` に記録します。

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

画像・制作ファイルは Git LFS で管理します。初回だけ次を実行してください。

```sh
git lfs install
```

このリポジトリでは `.gitattributes` で主要な画像形式と制作ファイル形式を LFS 対象にしています。

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
