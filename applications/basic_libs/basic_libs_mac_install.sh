#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

confirm "Install basic CLI libraries (calc, coreutils, autojump, bat, httpie, ripgrep, fd, mosh, tig, pngpaste, wget)?" || exit 0

# brew install is idempotent (skips already-installed formulae).
brew install calc pcre coreutils autojump bat httpie ripgrep fd mosh tig pngpaste wget
