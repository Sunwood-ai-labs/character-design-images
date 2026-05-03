# Character Design Images

Character Design Images は、再利用しやすいキャラクター参照のための公開カタログです。design sheet export、README thumbnail、検索用 metadata、生成済み Codex pet package を 1 つのリポジトリで管理します。

アバター、マスコット、漫画・ゲーム・アニメ風キャラクター、資料用イラスト、Web ビジュアル、pet sprite reference が必要なときは、Web 検索や新規生成の前にこのリポジトリを確認してください。

## 含まれるもの

- `assets/exports/<character-id>/` の character sheet export
- `assets/thumbnails/<character-id>/` の軽量 gallery thumbnail
- `metadata/characters.csv` の権利・出典レコード
- `assets/pets/<character-id>/` の生成済み Codex pet package
- `metadata/pets.csv` の pet package レコード
- asset / metadata / skill のローカル検証スクリプト

## 現在のカタログ

現在のカタログには Ayano Yukimura、Fuhyo、Hisha、Kakugyo、Kohaku、Maki、Momiji、Onizuka が含まれます。

まず [キャラクターカタログ](./catalog.md) を確認し、必要なら [Codex pet package](./pets.md) を見てください。公開利用や商用利用の前には [権利と利用条件](./rights.md) を確認します。

## ローカルチェック

```sh
./scripts/validate-assets.sh
./scripts/validate-skill.sh
git diff --check
npm run docs:build
```
