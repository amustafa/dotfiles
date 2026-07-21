#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v dust >/dev/null 2>&1; then
    echo "dust already installed"
    exit 0
fi

confirm "Install dust (disk usage viewer)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install dust
else
    # The crate that provides the `dust` binary is `du-dust`.
    cargo install du-dust
fi
