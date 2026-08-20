#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
# Make host wine visible regardless of distro layout:
#   /run/host/usr/bin       — FHS distros (Ubuntu, Fedora, Arch, …)
#   $HOME/.guix-profile/bin — Guix user profile
#   $HOME/.nix-profile/bin  — NixOS user profile
#   $HOME/.local/bin        — user-local installs
export PATH="/run/host/usr/local/bin:/run/host/usr/bin:$HOME/.guix-profile/bin:$HOME/.nix-profile/bin:$HOME/.local/bin:$PATH"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@"
