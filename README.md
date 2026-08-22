# Blackthorn Launcher — Flatpak packaging

Community Flatpak packaging for the [Blackthorn DAOC](https://blackthorn-daoc.com) launcher.

## Install

### Option A — via the repository (recommended, enables `flatpak update`)

```sh
flatpak remote-add --user blackthorn \
  https://pub-9e9ee456e8a84ce3a0ce37781fc8d8f3.r2.dev/blackthorn.flatpakrepo
flatpak install --user blackthorn com.blackthorn.daoc.Launcher
```

### Option B — standalone bundle

Download the latest `Blackthorn-Launcher-*.flatpak` from [Releases](../../releases) and install:

```sh
flatpak install --user Blackthorn-Launcher-*.flatpak
```

The bundle embeds the repository URL so `flatpak update` works after installation.

## Updating

```sh
flatpak update com.blackthorn.daoc.Launcher
```

Or let GNOME Software / KDE Discover handle it automatically.

## What's bundled

- **Wine** — Kron4ek WoW64 stable 11.0 (pure 64-bit host, no 32-bit ELF dependencies)
- **CEF runtime** — bundled so the in-game overlay works without a network fetch on first run

## Why Flatpak

- Sandboxed: runs isolated from the system, no risk of polluting your distro
- Self-contained: Wine and the CEF overlay runtime are bundled — nothing to install separately
- Works on any distro that supports Flatpak (Fedora, Arch, Debian, NixOS, …)
- `flatpak update` keeps the launcher current automatically

## Building locally

```sh
bash flatpak/setup.sh          # generates flatpak/generated-sources.json
flatpak run org.flatpak.Builder --user --install --force-clean \
  build-flatpak flatpak/com.blackthorn.daoc.Launcher.yml
```
