#!/usr/bin/env bash
# Shared helpers for the dotfiles install scripts.

# confirm "Prompt" — ask a yes/no question before an install step.
#   * Returns 0 (yes) / 1 (no). Defaults to No on empty input.
#   * ASSUME_YES=1 auto-accepts every prompt (unattended installs).
#   * ASSUME_NO=1  auto-declines every prompt.
#   * When stdin is not a terminal (e.g. `curl ... | sh`) prompts auto-decline
#     with a notice, unless ASSUME_YES=1.
confirm() {
    prompt="${1:-Continue?}"
    if [ "${ASSUME_YES:-0}" = 1 ]; then
        echo "==> $prompt [auto-yes]"
        return 0
    fi
    if [ "${ASSUME_NO:-0}" = 1 ]; then
        echo "==> $prompt [auto-no]"
        return 1
    fi
    if [ ! -t 0 ]; then
        echo "==> $prompt [skipped: non-interactive shell; set ASSUME_YES=1 to install]"
        return 1
    fi
    printf '==> %s [y/N]: ' "$prompt"
    read -r reply
    case "$reply" in
        [yY] | [yY][eE][sS]) return 0 ;;
        *) return 1 ;;
    esac
}

# link_config SRC DEST — symlink DEST -> SRC (absolute SRC), backing up any
# existing, non-matching DEST to DEST.old first. Idempotent: a no-op when DEST
# already points at SRC.
link_config() {
    src="$1"
    dest="$2"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "$dest already linked -> $src"
        return 0
    fi
    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest -> $dest.old"
        rm -rf "$dest.old"
        mv "$dest" "$dest.old"
    fi
    ln -sfn "$src" "$dest"
    echo "Linked $dest -> $src"
}
