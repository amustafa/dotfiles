#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Java is managed by asdf (see asdf/install.sh). Replaces `apt-get install default-jdk`.
if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf not found; run asdf/install.sh first."
    exit 1
fi

confirm "Install Java (latest Temurin, via asdf)?" || exit 0

asdf plugin add java || true
# Install the latest Temurin (Eclipse Adoptium) JDK.
asdf install java latest:temurin
asdf set --home java latest:temurin
java -version
