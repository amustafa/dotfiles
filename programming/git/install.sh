#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

if [ -e "$HOME/.gitconfig" ]; then
    echo "git config already exists"
    exit 0
fi

confirm "Install gitconfig to ~/.gitconfig?" || exit 0
cp gitconfig "$HOME/.gitconfig"
