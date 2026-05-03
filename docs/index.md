# Character Design Images

Character Design Images is a public-facing catalog for reusable character references. It stores design sheet exports, README thumbnails, searchable metadata, and generated Codex pet packages in one repository.

Use this repository before searching the web or generating a new character when a task needs an avatar, mascot, manga/game/anime character, deck illustration, website visual, or pet sprite reference.

## What is included

- Character sheet exports in `assets/exports/<character-id>/`
- Lightweight gallery thumbnails in `assets/thumbnails/<character-id>/`
- Rights and source records in `metadata/characters.csv`
- Generated Codex pet packages in `assets/pets/<character-id>/`
- Pet package records in `metadata/pets.csv`
- Local validation scripts for asset, metadata, and skill checks

## Current catalog

The catalog currently includes Ayano Yukimura, Fuhyo, Hisha, Kakugyo, Kohaku, Maki, Momiji, and Onizuka.

Start with the [character catalog](./catalog.md), review [Codex pet packages](./pets.md), then check [rights and reuse rules](./rights.md) before public or commercial use.

## Local checks

```sh
./scripts/validate-assets.sh
./scripts/validate-skill.sh
git diff --check
npm run docs:build
```
