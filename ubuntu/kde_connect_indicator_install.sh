#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v kdeconnect-cli >/dev/null 2>&1 || dpkg -s kdeconnect >/dev/null 2>&1; then
    echo "kdeconnect already installed"
    exit 0
fi

confirm "Install KDE Connect + indicator?" || exit 0

sudo add-apt-repository -y ppa:varlesh-l/indicator-kdeconnect
sudo apt-get update
sudo apt-get install -y kdeconnect indicator-kdeconnect
