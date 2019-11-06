# install proprietary graphics drivers

# install theme

echo 'XKBOPTIONS=“caps:ctrl_modifier”' >> /etc/default/keyboard
setxkbmap -option caps:ctrl_modifier

zsh chrome.sh
zsh croc_install.sh
zsh java_install.sh
zsh keybase.sh
zsh mega_install.sh
zsh spotify_install.sh
zsh virtualbox.sh
zsh yubikey_install.sh



echo "Go into Compiz setting manager and change desktop number General Options > Desktop Size"
echo "Go into Compiz setting manager and auto focus number General Options > Focus and Raise Behavior and then clear the 'Focus PreventionWindows'"
