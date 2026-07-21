#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v semgrep >/dev/null 2>&1; then
    echo "semgrep already installed"
    exit 0
fi

confirm "Install semgrep (static analysis)?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    brew install semgrep
else
    # Use pipx to avoid PEP 668 "externally-managed-environment" errors.
    if ! command -v pipx >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y pipx
    fi
    pipx install semgrep
fi
