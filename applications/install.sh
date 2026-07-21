#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

if [ "$(uname -s)" = Linux ]; then
    bash ubuntu_repo_prep.sh
fi
bash install_basic_libs.sh
bash eza_install.sh
bash fzf_install.sh
bash nerdfonts/install_nerdfonts.sh
