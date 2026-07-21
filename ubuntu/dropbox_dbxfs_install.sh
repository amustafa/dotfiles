#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Install dbxfs (mount Dropbox as a filesystem)?" || exit 0

# dbxfs mounts your Dropbox folder as a local filesystem.
# https://github.com/rianhunter/dbxfs
sudo apt-get update
sudo apt-get install -y libfuse2

if command -v dbxfs >/dev/null 2>&1; then
    echo "dbxfs already installed"
elif command -v pipx >/dev/null 2>&1; then
    pipx install dbxfs
else
    pip3 install --user dbxfs
fi

mkdir -p ~/Dropbox
echo "Run 'dbxfs ~/Dropbox' to mount your Dropbox (completes OAuth interactively)."
