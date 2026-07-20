
if [ "`uname -s`" = Linux ]; then
    zsh ubuntu_repo_prep.sh
fi
zsh install_basic_libs.sh
zsh eza_install.sh
zsh fzf_install.sh
zsh nerdfonts/install_nerdfonts.sh
