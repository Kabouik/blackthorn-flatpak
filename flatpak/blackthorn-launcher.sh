#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export PATH="/app/wine/bin:$PATH"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@"
