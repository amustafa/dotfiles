# install proprietary graphics drivers

# install theme

echo 'XKBOPTIONS=“caps:ctrl_modifier”' >> /etc/default/keyboard
setxkbmap -option caps:ctrl_modifier

echo "Go into Compiz setting manager and change desktop number General Options > Desktop Size"
echo "Go into Compiz setting manager and auto focus number General Options > Focus and Raise Behavior and then clear the 'Focus PreventionWindows'"
