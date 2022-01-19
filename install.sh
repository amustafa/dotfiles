if [ "`uname -s`" = Linux ]; then
    ./install_ubuntu.sh
elif [ "`uname -s`" = Darwin ]; then
    ./install_mac.sh
fi
