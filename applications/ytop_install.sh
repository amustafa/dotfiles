#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# ytop is deprecated by its author; bottom (btm) is the maintained successor.
if command -v btm >/dev/null 2>&1; then
    echo "bottom already installed"
    exit 0
fi

confirm "Install bottom (system monitor, successor to ytop)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install bottom
else
    cargo install bottom
fi
