#!/bin/sh
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export PATH="/app/wine/bin:$PATH"

# Restore host-style XDG dirs so the app config lands in the expected
# Flatpak data location rather than wherever the sandbox defaults to.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Redirect output to a log file. Writing to a closed Flatpak pipe on exit
# triggers write EIO in Electron's uncaughtException handler, which shows a
# spurious error dialog. A real file is not subject to EIO on shutdown.
mkdir -p "${XDG_CONFIG_HOME}/com.blackthorn"

LOG_DIR="${XDG_CACHE_HOME}/blackthorn"
mkdir -p "$LOG_DIR"
exec zypak-wrapper /app/lib/launcher/blackthorn-launcher "$@" \
  >>"$LOG_DIR/launcher.log" 2>&1
