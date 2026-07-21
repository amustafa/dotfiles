#!/usr/bin/env bash
set -eo pipefail

if command -v megasync >/dev/null 2>&1; then
    echo "MEGAsync already installed"
    exit 0
fi

# MEGAsync ships version-specific .deb packages; there is no stable "latest" URL.
echo "No automated MEGAsync installer available."
echo "Download the .deb for your Ubuntu release from https://mega.io/desktop"
