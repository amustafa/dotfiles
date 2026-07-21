#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

# Tmux Installer

# Install Tmux
if command -v tmux >/dev/null 2>&1; then
    echo "Tmux already installed"
elif confirm "Install tmux?"; then
    echo "Installing application"
    if [ "$(uname -s)" = Linux ]; then
        sudo apt-get update
        sudo apt-get install -y tmux
    elif [ "$(uname -s)" = Darwin ]; then
        brew install tmux reattach-to-user-namespace
    fi
fi

# Set default environment variables
echo "Setting Environment vars"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export AM_TMUX_CONFIG_HOME="${AM_TMUX_CONFIG_HOME:-$XDG_CONFIG_HOME/tmux}"

# Clone tpm into the .tmux folder
if [ -e ~/.tmux/plugins/tpm ]; then
    echo "tpm already installed"
elif confirm "Install tpm (tmux plugin manager)?"; then
    echo "Installing tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mkdir -p "$AM_TMUX_CONFIG_HOME"

# Copy gpakosz tmux conf
echo "Copying gpakosz tmux conf"
curl -fsSL https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf |
    sed "s@~/.tmux.conf.local@$AM_TMUX_CONFIG_HOME/tmux.conf.local@g" |
    sed "s@~/.tmux.conf@$AM_TMUX_CONFIG_HOME/gpakosz.tmux.conf@g" > "$AM_TMUX_CONFIG_HOME/gpakosz.tmux.conf"

# Copy config files
echo "Copying config files"
cp tmux/* "$AM_TMUX_CONFIG_HOME"

# link to expected location
if [ -e "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo ".tmux.conf already exists, moving to .tmux.conf.old"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.old"
fi
echo "Linking .tmux.conf to home"
ln -sfn "$AM_TMUX_CONFIG_HOME/tmux.conf" "$HOME/.tmux.conf"
