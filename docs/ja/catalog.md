# キャラクターカタログ

キャラクター一覧は `metadata/characters.csv` を source of truth とします。公開 preview asset は GitHub と docs site で表示できるよう、Git LFS ではなく通常の Git blob として保持します。

| Character | Notes | Preview | Export |
| --- | --- | --- | --- |
| Ayano Yukimura | Ice queen chibi design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/ayano-yukimura/ayano-yukimura_default_character-sheet_v001.jpg" width="160" alt="Ayano Yukimura"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/ayano-yukimura/ayano-yukimura_default_character-sheet_v001.jpeg) |
| Fuhyo | Shogi pawn design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/fuhyo/fuhyo_default_character-sheet_v001.jpg" width="160" alt="Fuhyo"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/fuhyo/fuhyo_default_character-sheet_v001.png) |
| Hisha | Shogi rook design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/hisha/hisha_default_character-sheet_v001.jpg" width="160" alt="Hisha"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/hisha/hisha_default_character-sheet_v001.png) |
| Kakugyo | Shogi bishop design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/kakugyo/kakugyo_default_character-sheet_v001.jpg" width="160" alt="Kakugyo"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/kakugyo/kakugyo_default_character-sheet_v001.png) |
| Kohaku | Tanuki cat girl design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/kohaku/kohaku_default_character-sheet_v001.jpg" width="160" alt="Kohaku"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/kohaku/kohaku_default_character-sheet_v001.png) |
| Maki | Mini cat character setting sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/maki/maki_default_character-sheet_v001.jpg" width="160" alt="Maki"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/maki/maki_default_character-sheet_v001.png) |
| Momiji | Fire fox girl design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/momiji/momiji_default_character-sheet_v001.jpg" width="160" alt="Momiji"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/momiji/momiji_default_character-sheet_v001.png) |
| Onizuka | Demon noble chibi design sheet | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/thumbnails/onizuka/onizuka_default_character-sheet_v001.jpg" width="160" alt="Onizuka"> | [character sheet](https://github.com/Sunwood-ai-labs/character-design-images/blob/main/assets/exports/onizuka/onizuka_default_character-sheet_v001.jpeg) |

## Metadata columns

`metadata/characters.csv` の列:

- `character_id`, `name`, `variant`, `view`, `version`
- `status`, `artist`, `source`, `rights`, `usage_scope`
- `image_path`, `notes`

各行は 12 fields を維持してください。検証コマンドが malformed record を検出します。
