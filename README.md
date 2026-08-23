# Blackthorn Launcher — Flatpak package

Community Flatpak packaging for the [Blackthorn DAOC](https://blackthorn-daoc.com) launcher.

## Why Flatpak

- Sandboxed: runs isolated from the system, no risk of polluting your distro, declared permissions
- Self-contained: Wine and the CEF BTUI runtime are bundled — nothing to install separately
- Works on any distribution that supports Flatpak (Debian, Fedora, Arch, NixOS, Guix, Gentoo, openSUSE, SteamOS, Bazzite…)
- `flatpak update` keeps the launcher current easily without manual downloads
- Shared runtimes between all installed Flatpaks, wasting less space than AppImages that each bundle copies of every library
- Desktop integration

## What is bundled

- **Wine** — [Kron4ek](https://github.com/Kron4ek/Wine-Builds) WoW64 stable 11.0 so wine does not vary among users
- **CEF runtime** — bundled so the in-game BTUI works without a network fetch on first run

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

The bundle embeds and enables the above repository URL so `flatpak update` works after installation.

## Updating

```sh
flatpak update com.blackthorn.daoc.Launcher
```

Or let your distribution update system (e.g., GNOME Software, KDE Discover) handle it automatically.


## Building locally

```sh
bash flatpak/setup.sh          # generates flatpak/generated-sources.json
flatpak run org.flatpak.Builder --user --install --force-clean \
  build-flatpak flatpak/com.blackthorn.daoc.Launcher.yml
```
