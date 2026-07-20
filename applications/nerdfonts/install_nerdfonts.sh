
if [ "`uname -s`" = Linux ]; then
    zsh install_ubuntu.sh
elif [ "`uname -s`" = Darwin ]; then
    zsh install_mac.sh
fi
