#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

if [ "$(uname -s)" = Linux ]; then
    bash install_ubuntu.sh
elif [ "$(uname -s)" = Darwin ]; then
    bash install_mac.sh
fi
