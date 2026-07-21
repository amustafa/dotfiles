#!/usr/bin/env bash
set -eo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

if command -v docker >/dev/null 2>&1; then
    echo "docker already installed: $(docker --version)"
    exit 0
fi

confirm "Install Docker?" || exit 0

if [ "$(uname -s)" = Darwin ]; then
    # Colima + the docker CLI is the free/open-source route (no Docker Desktop
    # license). Colima provides the Linux VM that runs the daemon.
    brew install docker colima
    echo "==> Start the runtime with 'colima start' (or 'brew services start colima' to run at login)."
else
    # Ubuntu: native Docker Engine from Docker's official apt repo.
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt-get update
    sudo apt-get install -y \
        docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    # Run docker without sudo (takes effect on next login).
    sudo usermod -aG docker "$USER"
    echo "==> Added $USER to the 'docker' group. Log out and back in for it to take effect."
fi
