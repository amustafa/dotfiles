python download_latest_neovim.py

pip install neovim
pip install flake8
pip install jedi
#sudo apt-get install python3-neovim

NVIM_APP_DIR=${HOME}/bin
NVIM_CONFIG_HOME=${HOME}/.config/nvim

git clone --depth=1 https://github.com/amix/vimrc.git $NVIM_CONFIG_HOME/vim_runtime
sh $NVIM_CONFIG_HOME/vim_runtime/install_awesome_vimrc.sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp my_plugins_config.vim $NVIM_CONFIG_HOME/vim_runtime
cp my_configs.vim $NVIM_CONFIG_HOME/vim_runtime
cp -r my_plugins.vim $NVIM_CONFIG_HOME/vim_runtime
cp init.vim $NVIM_CONFIG_HOME
