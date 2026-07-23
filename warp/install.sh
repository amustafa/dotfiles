#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, link_config).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

cd "$(dirname "$0")"

# Targets the stable warp-terminal data dirs (where these customizations were
# authored and are actively used). Not linked into warp-oss.
WARP_CONFIG_HOME="${HOME}/.config/warp-terminal"
WARP_DATA_HOME="${HOME}/.local/share/warp-terminal"

if confirm "Link Warp theme (Cyberwave Custom)?"; then
    link_config "$(pwd)/themes" "${WARP_DATA_HOME}/themes"
fi

if confirm "Link Warp tab configs (project-agnostic worktree + deploy templates)?"; then
    link_config "$(pwd)/tab_configs" "${WARP_DATA_HOME}/tab_configs"
fi

if confirm "Link Warp default tab config (worktree template override)?"; then
    link_config "$(pwd)/default_tab_configs" "${WARP_DATA_HOME}/default_tab_configs"
fi

if confirm "Link Warp custom model router (complexity-based Claude routing)?"; then
    link_config "$(pwd)/custom_model_routers" "${WARP_DATA_HOME}/custom_model_routers"
fi

if confirm "Link Warp keybindings?"; then
    link_config "$(pwd)/keybindings.yaml" "${WARP_CONFIG_HOME}/keybindings.yaml"
fi

echo "Warp config linked. Set the theme in Warp: Settings > Appearance > Themes > Cyberwave Custom."
