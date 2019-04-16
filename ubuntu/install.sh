sudo add-apt-repository ppa:kasra-mp/ubuntu-indicator-weather

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install ubuntu-restricted-extras wajig
# install proprietary graphics drivers

# install theme

sudo apt-get install -y git terminator keepass2 neovim compizconfig-settings-manager ubuntu-restricted-extras \
indicator-weather
echo 'XKBOPTIONS=“caps:ctrl_modifier”' >> /etc/default/keyboard

setxkbmap -option caps:ctrl_modifier

# terminal calculator
sudo apt-get install apcalc


echo "Go into Compiz setting manager and change desktop number General Options > Desktop Size"
echo "Go into Compiz setting manager and auto focus number General Options > Focus and Raise Behavior and then clear the 'Focus PreventionWindows'"
