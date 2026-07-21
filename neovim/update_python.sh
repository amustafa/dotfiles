#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Update the neovim python provider (pip install --upgrade neovim)?" || exit 0

# After installing or switching python env, run this to keep the neovim provider
# up to date. Then run :UpdateRemotePlugins inside nvim.
pip3 install --upgrade neovim
