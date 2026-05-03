# Codex Pet Packages

Codex pet packages are stored under `assets/pets/<character-id>/`. Each package keeps the runtime files and QA outputs together:

```text
pet.json
spritesheet.webp
frames/
preview/
final/validation.json
qa/contact-sheet.png
qa/review.json
qa/run-summary.json
```

The package index is `metadata/pets.csv`.

| Character | Animated preview | QA contact sheet | Package |
| --- | --- | --- | --- |
| Ayano Yukimura | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/ayano-yukimura/preview/ayano-yukimura_default_pet-preview_v001.webp" width="96" alt="Ayano Yukimura pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/ayano-yukimura/qa/contact-sheet.png" width="160" alt="Ayano Yukimura pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/ayano-yukimura) |
| Fuhyo | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/fuhyo/preview/fuhyo_default_pet-preview_v001.webp" width="96" alt="Fuhyo pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/fuhyo/qa/contact-sheet.png" width="160" alt="Fuhyo pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/fuhyo) |
| Hisha | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/hisha/preview/hisha_default_pet-preview_v001.webp" width="96" alt="Hisha pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/hisha/qa/contact-sheet.png" width="160" alt="Hisha pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/hisha) |
| Kakugyo | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/kakugyo/preview/kakugyo_default_pet-preview_v001.webp" width="96" alt="Kakugyo pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/kakugyo/qa/contact-sheet.png" width="160" alt="Kakugyo pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/kakugyo) |
| Kohaku | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/kohaku/preview/kohaku_default_pet-preview_v001.webp" width="96" alt="Kohaku pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/kohaku/qa/contact-sheet.png" width="160" alt="Kohaku pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/kohaku) |
| Maki | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/maki/preview/maki_default_pet-preview_v001.webp" width="96" alt="Maki pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/maki/qa/contact-sheet.png" width="160" alt="Maki pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/maki) |
| Momiji | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/momiji/preview/momiji_default_pet-preview_v001.webp" width="96" alt="Momiji pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/momiji/qa/contact-sheet.png" width="160" alt="Momiji pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/momiji) |
| Onizuka | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/onizuka/preview/onizuka_default_pet-preview_v001.webp" width="96" alt="Onizuka pet animation preview"> | <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/character-design-images/main/assets/pets/onizuka/qa/contact-sheet.png" width="160" alt="Onizuka pet contact sheet"> | [package](https://github.com/Sunwood-ai-labs/character-design-images/tree/main/assets/pets/onizuka) |

## Preview generation

```sh
./scripts/generate-web-previews.py
```

The validation script confirms that every animated WebP preview covers the sprite-sheet states recorded in the frame manifest.
