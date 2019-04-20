python download_latest_neovim.py

pip install neovim
pip install flake8
pip install jedi
#sudo apt-get install python3-neovim

NVIM_APP_DIR=${HOME}/opt
NVIM_CONFIG_HOME=${HOME}/.config/nvim

if [ -e nvim.appimage ]; then
    mkdir -p $NVIM_APP_DIR/nvim/bin
    chmod u+x nvim.appimage
    mv nvim.appimage $NVIM_APP_DIR/nvim/bin
    ln -s $NVIM_APP_DIR/nvim/bin/nvim.appimage $HOME/bin
else
    tar xzvf nvim-macos.tar.gz
    rm nvim-macos.tar.gz
    mv nvim-osx64 $NVIM_APP_DIR/nvim
    ln -s $NVIM_APP_DIR/nvim/bin/nvim $HOME/bin
fi

git clone --depth=1 https://github.com/amix/vimrc.git $NVIM_CONFIG_HOME/vim_runtime
sh $NVIM_CONFIG_HOME/vim_runtime/install_awesome_vimrc.sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp my_plugins_config.vim $NVIM_CONFIG_HOME/vim_runtime
cp my_configs.vim $NVIM_CONFIG_HOME/vim_runtime
cp -r my_plugins.vim $NVIM_CONFIG_HOME/vim_runtime
cp init.vim $NVIM_CONFIG_HOME
