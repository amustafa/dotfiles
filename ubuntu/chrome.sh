#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v google-chrome >/dev/null 2>&1; then
    echo "Google Chrome already installed"
    exit 0
fi

confirm "Install Google Chrome?" || exit 0

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

wget -O "$tmp/google-chrome.deb" \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get update
# Modern apt resolves the .deb's dependencies directly (no dpkg + apt -f dance,
# and the old libappindicator1/libindicator7 packages are gone in recent Ubuntu).
sudo apt-get install -y "$tmp/google-chrome.deb"
