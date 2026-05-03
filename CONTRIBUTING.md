# Contributing

This repository is a curated character asset catalog. Keep changes focused,
metadata-backed, and easy to validate.

## Asset Placement

- Put public character-sheet exports under `assets/exports/<character-id>/`.
- Put README and docs thumbnails under `assets/thumbnails/<character-id>/`.
- Put Codex pet packages under `assets/pets/<character-id>/`.
- Put large source files and reference bundles under `assets/originals/` or
  `assets/references/`, which are Git LFS-managed.
- Do not leave imported images at the repository root.

## Metadata

Update `metadata/characters.csv` for every character sheet and
`metadata/pets.csv` for every pet package. Keep rights and usage fields
conservative unless the permission source is clear.

## Validation

Run:

```sh
./scripts/validate-assets.sh
./scripts/validate-skill.sh
git diff --check
awk -F, 'NR == 1 {next} NF != 12 {print "bad field count", NR, NF, $0; bad=1} END {exit bad}' metadata/characters.csv
git lfs ls-files
npm run docs:build
```

`git lfs ls-files` should normally be empty unless source or reference files
were intentionally added.
