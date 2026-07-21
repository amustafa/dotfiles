#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

if command -v nvim >/dev/null 2>&1; then
    echo "neovim already installed: $(nvim --version | head -n1)"
elif confirm "Install neovim?"; then
    if [ "$(uname -s)" = Darwin ]; then
        brew install neovim
    else
        python download_latest_neovim.py
    fi
fi

# Python provider + common tooling (installed into the active asdf python).
if confirm "Install neovim python tooling (neovim, flake8, jedi, yapf, tox)?"; then
    pip install --upgrade neovim flake8 jedi yapf tox
fi

# Node provider host package (enables the node remote-plugin provider).
if command -v npm >/dev/null 2>&1; then
    if confirm "Install neovim node provider (npm -g neovim)?"; then
        npm install -g neovim
    fi
else
    echo "npm not found; skipping node provider (install node via asdf first)."
fi

# CLI tools the neovim config relies on:
#   * tree-sitter  - parser generator used by nvim-treesitter (auto_install).
#   * gh           - GitHub CLI required by octo.nvim.
# brew is available on both macOS and Linux in this setup and is idempotent
# (skips already-installed formulae).
if command -v brew >/dev/null 2>&1; then
    if confirm "Install neovim CLI deps (tree-sitter, gh)?"; then
        brew install tree-sitter gh
    fi
else
    echo "brew not found; skipping tree-sitter/gh (install them manually for treesitter + octo.nvim)."
fi

NVIM_APP_DIR="${HOME}/opt"
NVIM_CONFIG_HOME="${HOME}/.config/nvim"

if [ -e nvim.appimage ]; then
    mkdir -p "$NVIM_APP_DIR/nvim/bin" "${HOME}/bin"
    chmod u+x nvim.appimage
    mv nvim.appimage "$NVIM_APP_DIR/nvim/bin"
    ln -sfn "$NVIM_APP_DIR/nvim/bin/nvim.appimage" "${HOME}/bin/nvim"
fi

# Plugins are managed by lazy.nvim, which init.lua bootstraps on first run.
link_config "$(pwd)/config" "$NVIM_CONFIG_HOME"
