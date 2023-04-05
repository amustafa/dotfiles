#if [ "`uname -s`" = Darwin ]; then
#    brew install neovim
#else
#    python download_latest_neovim.py
#fi

#pyenv shell use nvim
pip install neovim
pip install flake8
pip install jedi
pip install yapf
pip install tox

NVIM_APP_DIR=${HOME}/opt
NVIM_CONFIG_HOME=${HOME}/.config/nvim
NVIM_DATA_DIR=${HOME}/.local

if [ -e nvim.appimage ]; then
    mkdir -p $NVIM_APP_DIR/nvim/bin
    chmod u+x nvim.appimage
    mv nvim.appimage $NVIM_APP_DIR/nvim/bin
    ln -s $NVIM_APP_DIR/nvim/bin/nvim.appimage $HOME/bin/nvim
# else USED WHEN DOWNLOADING
#     tar xzvf nvim-macos.tar.gz
#     rm nvim-macos.tar.gz
#     mv nvim-osx64 $NVIM_APP_DIR/nvim
#     ln -s $NVIM_APP_DIR/nvim/bin/nvim $HOME/bin
fi

# Install vim.plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $NVIM_CONFIG_HOME
ln -s `pwd`/vimrcs $NVIM_CONFIG_HOME/vimrcs
ln -s `pwd`/init.vim $NVIM_CONFIG_HOME/init.vim
