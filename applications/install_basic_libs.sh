
if [ "`uname -s`" = Linux ]; then
    zsh basic_libs/basic_libs_ubuntu_install.sh
elif [ "`uname -s`" = Darwin ]; then
    zsh basic_libs/basic_libs_mac_install.sh
fi
