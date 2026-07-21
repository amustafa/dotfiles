#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Download just the Hack Nerd Font from the latest release instead of cloning the
# entire (multi-GB) nerd-fonts repo and installing every font.
FONT_DIR="${HOME}/.local/share/fonts"

if [ -f "$FONT_DIR/HackNerdFont-Regular.ttf" ]; then
    echo "Hack Nerd Font already installed"
    exit 0
fi

confirm "Install Hack Nerd Font?" || exit 0

mkdir -p "$FONT_DIR"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fL -o "$tmp/Hack.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
unzip -o "$tmp/Hack.zip" -d "$FONT_DIR"
fc-cache -f "$FONT_DIR"
