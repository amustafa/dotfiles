#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v jq >/dev/null 2>&1; then
    echo "jq already installed"
    exit 0
fi

confirm "Install jq (JSON processor)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install jq
else
    sudo apt-get update
    sudo apt-get install -y jq
fi
