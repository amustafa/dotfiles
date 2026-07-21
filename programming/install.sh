#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

# Do not add python here (managed by asdf via python/install_python.sh).
bash git/install.sh
bash node/node_install.sh
bash rust/install.sh
bash golang/golang_install.sh
bash lua/lua_install.sh

# spark has no automated installer; install.sh is just a manual reminder.
cat spark/install.sh

# DO NOT AUTO ADD CUDA
