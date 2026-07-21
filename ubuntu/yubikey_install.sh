#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v ykman >/dev/null 2>&1; then
    echo "yubikey tooling already installed"
    exit 0
fi

confirm "Install YubiKey tools (libpam-u2f, yubikey-manager)?" || exit 0

sudo apt-add-repository -y ppa:yubico/stable
sudo apt-get update
sudo apt-get install -y libpam-u2f yubikey-manager
