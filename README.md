# Blackthorn Launcher — Flatpak packaging

Community Flatpak packaging for the [Blackthorn DAOC](https://blackthorn-daoc.com) launcher.

## Install

Download the latest `Blackthorn-Launcher-*.flatpak` from [Releases](../../releases) and install:

```
flatpak install --user Blackthorn-Launcher-*.flatpak
```

## What's bundled

- **Wine** — Kron4ek staging WoW64 11.0 (pure 64-bit host, no 32-bit ELF dependencies)
- **CEF runtime** — bundled so the in-game overlay works without a network fetch on first run

## Why Flatpak

- Sandboxed: runs isolated from the system, no risk of polluting your distro
- Self-contained: Wine and the CEF overlay runtime are bundled — nothing to install separately
- Works on any distro that supports Flatpak (Fedora, Arch, Debian, NixOS, …)
- `flatpak update` can keep the launcher current without manual re-downloads

## Automatic updates (hypothetical)

`flatpak update` requires a hosted OSTree repository. The package is ~500 MB, which
exceeds GitHub Pages' 100 MB per-file limit, so Pages cannot host the repo.

One option for this community packaging: publish the repo to Cloudflare R2 (free tier,
no file size limits) after each CI build. The workflow already has a gated step for this
— it activates when `FLATPAK_REPO_URL`, `CF_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`, and
`R2_SECRET_ACCESS_KEY` are set as repository secrets/variables.

If the upstream project ever wants to host it officially, the repo could live at
`https://blackthorn-daoc.com/download/flatpakrepo` and be published by their existing
CI infrastructure alongside other release artifacts.

## Building locally

```sh
bash flatpak/setup.sh          # generates flatpak/generated-sources.json
flatpak run org.flatpak.Builder --user --install --force-clean \
  build-flatpak flatpak/com.blackthorn.daoc.Launcher.yml
```
