#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Rust is managed by asdf (see asdf/install.sh). Replaces the old rustup setup.
if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf not found; run asdf/install.sh first."
    exit 1
fi

confirm "Install Rust (latest, via asdf)?" || exit 0

asdf plugin add rust || true
asdf install rust latest
asdf set --home rust latest
rustc --version
