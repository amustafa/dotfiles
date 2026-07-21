#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v keybase >/dev/null 2>&1; then
    echo "Keybase already installed"
    exit 0
fi

confirm "Install Keybase?" || exit 0

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fL -o "$tmp/keybase_amd64.deb" https://prerelease.keybase.io/keybase_amd64.deb
sudo apt-get update
sudo apt-get install -y "$tmp/keybase_amd64.deb"
run_keybase
