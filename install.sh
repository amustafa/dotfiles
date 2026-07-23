#!/usr/bin/env bash
set -e

# Run every step relative to this checkout, wherever it happens to live, instead
# of a hardcoded path (which could point at a stale clone).
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Ensures a local version of the config
touch config.local.ini

# Necessary program folders
mkdir -p "${HOME}/bin" "${HOME}/usr" "${HOME}/opt"

PATH_TO_ADD="$HOME/bin:/usr/local/bin"
[[ ":$PATH:" != *":${PATH_TO_ADD}:"* ]] && PATH="${PATH_TO_ADD}:${PATH}"

export XDG_CONFIG_HOME="$HOME/.config"

# Homebrew provides asdf and many CLI tools on both macOS and Linux.
bash install_brew.sh

# asdf manages all language runtimes (python, node, rust, java). Install it first
# so the runtime installers below can use it.
cd asdf
bash install.sh
cd ..

# Make asdf shims available for the rest of this install run.
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Install python via asdf (other scripts may be written in python).
echo "Installing Python via asdf ..."
cd python
bash install_python.sh
cd ..

cd applications
bash install.sh
cd ..

cd zsh
bash install.sh
cd ..

cd neovim
bash install.sh
cd ..

cd warp
bash install.sh
cd ..

# cd tmux
# bash install.sh
# cd ..

cd programming
bash install.sh
cd ..

if [ "$(uname -s)" = Linux ]; then
    cd ubuntu
    bash install.sh
    cd ..
fi

if [ "$(uname -s)" = Darwin ]; then
    cd macos
    bash defaults.sh
    cd ..
fi

echo "UPDATE ZSHRC"
