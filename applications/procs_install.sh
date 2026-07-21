#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v procs >/dev/null 2>&1; then
    echo "procs already installed"
    exit 0
fi

confirm "Install procs (modern ps)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install procs
else
    cargo install procs
fi
