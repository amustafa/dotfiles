#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v croc >/dev/null 2>&1; then
    echo "croc already installed"
    exit 0
fi

confirm "Install croc (file transfer)?" || exit 0

curl -fsSL https://getcroc.schollz.com | bash
