#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
# Make host system binaries (wine, etc.) visible inside the sandbox
export PATH="/run/host/usr/local/bin:/run/host/usr/bin:$PATH"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@"
