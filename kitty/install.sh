#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

if [ -L "${HOME}/.config/kitty/kitty.conf" ] \
    && [ "$(readlink "${HOME}/.config/kitty/kitty.conf")" = "$(pwd)/kitty.conf" ]; then
    echo "kitty config already linked"
    exit 0
fi

confirm "Link kitty config into ~/.config/kitty?" || exit 0
link_config "$(pwd)/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
