#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v eza >/dev/null 2>&1; then
    echo "eza already installed: $(eza --version | head -n1)"
    exit 0
fi

confirm "Install eza (modern ls)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install eza
else
    # eza is only in the default apt repos on Ubuntu 24.04+. Try apt first, then
    # fall back to the community (gierens) repo for older releases.
    if ! sudo apt-get install -y eza 2>/dev/null; then
        sudo mkdir -p /etc/apt/keyrings
        wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
            | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
            | sudo tee /etc/apt/sources.list.d/gierens.list >/dev/null
        sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
        sudo apt-get update
        sudo apt-get install -y eza
    fi
fi
