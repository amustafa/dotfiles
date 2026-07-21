#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Install Python (latest, via asdf)?" || exit 0

# Python is managed by asdf (see asdf/install.sh). Replaces the old pyenv setup.
# asdf's python plugin builds CPython from source (python-build), so the same
# build prerequisites pyenv needed are still required.
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
if [ "$(uname -s)" = Linux ]; then
    sudo apt-get update
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
elif [ "$(uname -s)" = Darwin ]; then
    brew install openssl readline sqlite3 xz zlib tcl-tk
fi

if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf not found; run asdf/install.sh first."
    exit 1
fi

asdf plugin add python || true
asdf install python latest
asdf set --home python latest

python -m pip install --upgrade pip
python -m pip install requests
