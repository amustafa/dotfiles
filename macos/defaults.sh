#!/usr/bin/env bash
set -e

# macOS system defaults. Safe to re-run; each `defaults write` is idempotent.
# Apply changes without a full reboot where possible, but note that some
# settings (notably keyboard) only take effect for apps launched afterwards.

echo "Applying macOS defaults ..."

# --- Keyboard -----------------------------------------------------------------

# Let held keys auto-repeat (e.g. holding `j` in Neovim) instead of popping the
# accent/diacritic menu. This is the default macOS behavior that breaks key
# repeat in terminal editors.
defaults write -g ApplePressAndHoldEnabled -bool false

# Fast key repeat. These can go below the System Settings slider minimums.
# Lower = faster. KeyRepeat is the repeat rate; InitialKeyRepeat is the delay
# before repeating starts.
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

echo "macOS defaults applied. Log out/in (or restart apps) for keyboard changes to take effect."
