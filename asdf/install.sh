#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# asdf is the single version manager for language runtimes (node, python, rust,
# java, golang). asdf 0.16.0+ ships as one Go binary; the old `git clone ~/.asdf`
# method is no longer supported. Install via a package manager (recommended) or a
# release binary from https://github.com/asdf-vm/asdf/releases.
if command -v asdf >/dev/null 2>&1; then
    echo "asdf already installed: $(asdf --version)"
elif ! confirm "Install asdf (language runtime version manager)?"; then
    exit 0
elif command -v brew >/dev/null 2>&1; then
    brew install asdf
elif command -v go >/dev/null 2>&1; then
    go install github.com/asdf-vm/asdf/cmd/asdf@latest
else
    echo "Install asdf manually: download a binary from"
    echo "  https://github.com/asdf-vm/asdf/releases"
    echo "and place it on your PATH."
    exit 1
fi

# Make shims available for the remainder of the install run.
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

asdf --version
