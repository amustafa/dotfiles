#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Installs fzf into the opt folder and links the binary into ~/bin.
if command -v fzf >/dev/null 2>&1; then
    echo "fzf already installed: $(fzf --version)"
    exit 0
fi

confirm "Install fzf (fuzzy finder)?" || exit 0

mkdir -p "${HOME}/opt" "${HOME}/bin"
FZF_BASE="${HOME}/opt/fzf"

if [ -d "$FZF_BASE/.git" ]; then
    git -C "$FZF_BASE" pull --ff-only
else
    git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_BASE"
fi

# --bin just builds the binary; shell integration is handled by the zsh config.
"$FZF_BASE/install" --bin

ln -sfn "$FZF_BASE/bin/fzf" "${HOME}/bin/fzf"
