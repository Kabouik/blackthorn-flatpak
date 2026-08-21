#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export PATH="/app/wine/bin:${PATH}"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@"
