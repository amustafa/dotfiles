#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed: $(brew --version | head -n1)"
    exit 0
fi

confirm "Install Homebrew?" || exit 0

if [ "$(uname -s)" = Linux ]; then
    sudo apt-get update
    sudo apt-get install -y build-essential curl file git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
elif [ "$(uname -s)" = Darwin ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
