#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export PATH="/app/wine/bin:$PATH"
export LANG="${LANG:-C.UTF-8}"
export LC_CTYPE="${LC_CTYPE:-${LANG}}"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@"
