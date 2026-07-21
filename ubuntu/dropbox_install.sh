#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v dropbox >/dev/null 2>&1; then
    echo "Dropbox already installed"
    exit 0
fi

confirm "Install Dropbox?" || exit 0

sudo apt-get update
sudo apt-get install -y nautilus-dropbox
echo "Launch Dropbox once to complete the daemon download and sign in."
