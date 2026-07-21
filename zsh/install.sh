#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

# Set default env vars
echo "Setting Environment vars"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZSH_CONFIG_HOME="${ZSH_CONFIG_HOME:-$XDG_CONFIG_HOME/zsh}"
export ANTIDOTE_DIR="$HOME/.antidote"

# Install ZSH
if command -v zsh >/dev/null 2>&1; then
    echo "ZSH already installed"
elif confirm "Install zsh?"; then
    echo "Installing application"
    if [ "$(uname -s)" = Linux ]; then
        sudo apt-get update
        sudo apt-get install -y zsh
    elif [ "$(uname -s)" = Darwin ]; then
        brew install zsh
    fi
fi

# Verify
command -v zsh >/dev/null 2>&1 && zsh --version

# Install antidote
if [ -e "$ANTIDOTE_DIR" ]; then
    echo "Antidote already installed"
elif confirm "Install antidote (zsh plugin manager)?"; then
    echo "Installing Antidote"
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

# Set as default shell
if [ "$(basename "${SHELL:-}")" = "zsh" ]; then
    echo "Zsh is already the current shell"
elif confirm "Make zsh your default shell (chsh)?"; then
    chsh -s "$(command -v zsh)" || echo "WARN: chsh failed; change your default shell to zsh manually"
fi

# Install direnv, fzf, git (used by the zsh config)
if command -v direnv >/dev/null 2>&1; then
    echo "direnv already installed"
elif confirm "Install direnv, fzf, and git?"; then
    if [ "$(uname -s)" = Linux ]; then
        sudo apt-get update
        sudo apt-get install -y direnv fzf git
    elif [ "$(uname -s)" = Darwin ]; then
        brew install direnv fzf git
    fi
fi

# Link the zsh config dir into place (repo config/ becomes $ZSH_CONFIG_HOME).
link_config "$(pwd)/config" "$ZSH_CONFIG_HOME"
link_config "$ZSH_CONFIG_HOME/zshrc" "$HOME/.zshrc"
