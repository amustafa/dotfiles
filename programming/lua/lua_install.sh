#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Lua is managed by asdf (see asdf/install.sh).
if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf not found; run asdf/install.sh first."
    exit 1
fi

confirm "Install Lua + LuaRocks (latest, via asdf)?" || exit 0

# asdf install is idempotent: it skips a version that is already installed.
# The asdf-lua plugin bundles LuaRocks, so it comes along with the Lua install
# (there is no separate `luarocks` asdf plugin).
asdf plugin add lua || true
asdf install lua latest
asdf set --home lua latest

# Expose the bundled luarocks shim, then report both versions.
asdf reshim lua
lua -v
luarocks --version
