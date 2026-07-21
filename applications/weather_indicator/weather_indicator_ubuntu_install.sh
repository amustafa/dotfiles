#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if dpkg -s indicator-weather >/dev/null 2>&1; then
    echo "indicator-weather already installed"
    exit 0
fi

confirm "Install indicator-weather?" || exit 0

sudo add-apt-repository -y ppa:kasra-mp/ubuntu-indicator-weather
sudo apt-get update
sudo apt-get install -y indicator-weather
