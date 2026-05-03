# Security Policy

## Supported Branch

The supported branch is `main`.

## Reporting

Please report security issues privately through the repository owner or the
maintainer channel used by Sunwood AI Labs.

Do not open a public issue for:

- leaked credentials
- private source files
- rights-sensitive asset metadata
- accidental publication of material that should remain internal

## Sensitive Assets

Large source files and reference bundles belong in Git LFS-managed paths:

```text
assets/originals/
assets/references/
```

Public preview assets in `assets/exports/`, `assets/thumbnails/`, and
`assets/pets/` are intentionally normal Git blobs so GitHub can render them.
Check `RIGHTS.md` and metadata before using those assets outside review.
