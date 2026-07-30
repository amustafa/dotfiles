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
#   * gh           - GitHub CLI required by octo.nvim.
#   * lazygit      - Snacks.lazygit / lazygit.nvim.
#   * imagemagick  - `magick`, image conversion for Snacks.image.
#   * ghostscript  - `gs`, PDF rendering for Snacks.image.
#   * tectonic     - LaTeX math rendering for Snacks.image.
#   * mermaid-cli  - `mmdc`, Mermaid diagram rendering for Snacks.image.
#   * markdownlint-cli - `markdownlint`, markdown linter used by nvim-lint
#                    (lua/plugins/lint.lua); saving markdown errors without it.
# NOTE: Snacks.image only *displays* images in terminals that support the kitty
# graphics protocol (kitty/wezterm/ghostty) - not Warp/Terminal.app.
# brew is available on both macOS and Linux in this setup and is idempotent
# (skips already-installed formulae).
if command -v brew >/dev/null 2>&1; then
    if confirm "Install neovim CLI deps (gh, lazygit, imagemagick, ghostscript, tectonic, mermaid-cli, markdownlint-cli)?"; then
        brew install gh lazygit imagemagick ghostscript tectonic mermaid-cli markdownlint-cli
    fi
else
    echo "brew not found; skipping neovim CLI deps (install gh, lazygit, imagemagick, ghostscript, tectonic, mermaid-cli, markdownlint-cli manually)."
fi

# tree-sitter CLI (standalone tool). The Homebrew `tree-sitter` formula ships only
# the library, not the CLI, so install it from npm.
# NOTE: nvim-treesitter is pinned to its `master` branch, which cannot *generate*
# parsers that require ABI 15 (e.g. latex) with any current CLI - so those parsers
# are not in ensure_installed. Parsers that ship pre-generated sources build fine.
if command -v npm >/dev/null 2>&1; then
    if confirm "Install tree-sitter CLI (npm -g tree-sitter-cli)?"; then
        npm install -g tree-sitter-cli
    fi
else
    echo "npm not found; skipping tree-sitter CLI (install node via asdf, then npm install -g tree-sitter-cli)."
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
