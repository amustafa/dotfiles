#!/usr/bin/env bash
set -euo pipefail

# Load shared helpers (confirm, ...).
_h="$(cd "$(dirname "$0")" && pwd)"; _r="$_h"
while [ "$_r" != "/" ] && [ ! -f "$_r/lib.sh" ]; do _r="$(dirname "$_r")"; done
. "$_r/lib.sh"

# Moves /home to an external drive.
# Taken from https://help.ubuntu.com/community/Partitioning/Home/Moving
# DESTRUCTIVE — review carefully before running. Set HOME_DRIVE_UUID first.
: "${HOME_DRIVE_UUID:?Set HOME_DRIVE_UUID to the target partition UUID}"

confirm "Add /media/external_home to fstab and mount it? (edits /etc/fstab)" || exit 0

sudo cp /etc/fstab "/etc/fstab.$(date +%Y-%m-%d)"

if ! grep -q "$HOME_DRIVE_UUID" /etc/fstab; then
    echo "UUID=$HOME_DRIVE_UUID   /media/external_home    ext4    defaults    0    2" \
        | sudo tee -a /etc/fstab >/dev/null
fi

sudo mkdir -p /media/external_home
sudo mount -a

# Copy is left as a manual step so you can verify the mount first.
echo "Mounted /media/external_home. To migrate your home directory, run:"
echo "  sudo rsync -aXS --exclude='/*/.gvfs' /home/. /media/external_home/."
