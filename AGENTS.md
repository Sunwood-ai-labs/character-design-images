# Repository Instructions

This repository stores public character design image sheets and their metadata.

## Default Workflow

- After every meaningful change, run the relevant verification commands, commit, and push to `origin/main`.
- Do not leave completed work only in the local working tree unless the user explicitly asks not to commit or push.
- Prefer small, focused commits that describe the asset or metadata change.

## Verification

Run these before commit/push when asset organization or metadata changes:

```sh
./scripts/validate-assets.sh
git diff --check
awk -F, 'NR == 1 {next} NF != 12 {print "bad field count", NR, NF, $0; bad=1} END {exit bad}' metadata/characters.csv
```

Also check that public preview assets are not Git LFS pointers:

```sh
git lfs ls-files
```

`git lfs ls-files` should normally be empty unless source files were added under `assets/originals/` or `assets/references/`.

## Asset Placement

- Put public character-sheet exports under `assets/exports/<character-id>/`.
- Put README gallery thumbnails under `assets/thumbnails/<character-id>/`.
- Put large source files and reference bundles under `assets/originals/` or `assets/references/`, which are Git LFS-managed.
- Do not leave imported images at the repository root after organization is complete.

## Naming

Use the pattern documented in `docs/naming.md`:

```text
<character-id>_<variant>_<view>_<version>.<ext>
```

For character sheets, prefer:

```text
<character-id>_default_character-sheet_v001.<ext>
```

Keep `assets/exports/` and `assets/thumbnails/` as normal Git blobs so GitHub can render previews in the public repository.
