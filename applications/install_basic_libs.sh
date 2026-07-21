#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

if [ "$(uname -s)" = Linux ]; then
    bash basic_libs/basic_libs_ubuntu_install.sh
elif [ "$(uname -s)" = Darwin ]; then
    bash basic_libs/basic_libs_mac_install.sh
fi
