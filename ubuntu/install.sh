#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

# Map Caps Lock to Ctrl (idempotent; use straight quotes so xkb parses it).
if ! grep -q 'caps:ctrl_modifier' /etc/default/keyboard 2>/dev/null; then
    echo 'XKBOPTIONS="caps:ctrl_modifier"' | sudo tee -a /etc/default/keyboard >/dev/null
fi
setxkbmap -option caps:ctrl_modifier || true

# Optional apps: isolate failures so one bad install doesn't abort the rest.
for s in chrome.sh croc_install.sh java_install.sh keybase.sh mega_install.sh \
         spotify_install.sh virtualbox.sh yubikey_install.sh; do
    echo "=== $s ==="
    bash "$s" || echo "WARN: $s failed, continuing"
done

echo "Compiz: General Options > Desktop Size to set desktop number."
echo "Compiz: General Options > Focus and Raise Behavior, clear 'Focus Prevention Windows'."
