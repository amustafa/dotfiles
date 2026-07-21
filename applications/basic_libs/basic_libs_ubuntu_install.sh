#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Install basic CLI libraries (git, terminator, keepass2, mosh, bat, httpie, tig, ripgrep, fd, wget, zoxide, ...)?" || exit 0

sudo apt-get update
sudo apt-get install -y \
    ubuntu-restricted-extras \
    git terminator keepass2 mosh \
    compizconfig-settings-manager \
    build-essential \
    apcalc libpcre3 libpcre3-dev \
    ack bat httpie ncdu tig ripgrep fd-find wget zoxide
