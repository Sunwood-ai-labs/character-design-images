# Rights

This repository stores character design images, generated pet sprites, preview
assets, and metadata. It does not grant a blanket license for the visual assets.

画像・pet sprite・preview asset・metadata を整理するリポジトリですが、ビジュアル素材に対して一括ライセンスは付与しません。

## Default Policy

- If an image does not explicitly grant a usage scope, do not use it externally,
  redistribute it, or use it commercially.
- Record the source URL or acquisition source in `metadata/characters.csv` when
  adding references or third-party material.
- Keep assets with unverified third-party material at `usage_scope=internal-review`.
- Confirm rights for both source files and exported previews before public,
  redistributed, commercial, or generated derivative use.

## デフォルトポリシー

- 明示的な利用範囲がない画像は、外部利用・再配布・商用利用を許可しません。
- 参考画像や第三者素材を追加する場合は、出典 URL や入手元を `metadata/characters.csv` の `source` に記録してください。
- 第三者素材を含む画像は、利用条件が確認できるまで `usage_scope=internal-review` にしてください。
- 公開・配布・商用利用・生成物への派生利用を行う前に、元データと書き出し画像の両方で権利確認を済ませてください。

## Recommended Values

`rights`:

- `owned`
- `licensed`
- `third-party`
- `unknown`

`usage_scope`:

- `internal-review`
- `portfolio`
- `public-release`
- `commercial`
- `do-not-use`

## Current Catalog Status

The current character records use `rights=unknown` and
`usage_scope=internal-review`. Treat them as review-visible catalog entries, not
as assets approved for public reuse or redistribution.

現在の character record は `rights=unknown` / `usage_scope=internal-review`
です。公開カタログとして閲覧できますが、外部再利用・再配布が承認済みの素材として扱わないでください。
