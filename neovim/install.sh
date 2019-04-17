pip install neovim
pip install flake8
pip install jedi

NVIM_HOME=${HOME}/.config/nvim
git clone --depth=1 https://github.com/amix/vimrc.git $NVIM_HOME/vim_runtime
sh $NVIM_HOME/vim_runtime/install_awesome_vimrc.sh

cp my_plugins_config.vim $NVIM_HOME/vim_runtime
cp init.vim $NVIM_HOME
