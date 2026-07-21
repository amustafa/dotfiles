#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if snap list spotify >/dev/null 2>&1; then
    echo "Spotify already installed"
    exit 0
fi

confirm "Install Spotify?" || exit 0

sudo snap install spotify
