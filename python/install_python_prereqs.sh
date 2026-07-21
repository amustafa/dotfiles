#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Install Python build prerequisites?" || exit 0

# Build prerequisites for compiling CPython from source.
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
if [ "$(uname -s)" = Linux ]; then
    sudo apt-get update
    sudo apt-get install -y build-essential gdb lcov pkg-config \
        libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
        libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
        lzma lzma-dev tk-dev uuid-dev zlib1g-dev
elif [ "$(uname -s)" = Darwin ]; then
    brew install openssl readline sqlite3 xz zlib tcl-tk
fi
