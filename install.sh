# Ensures a local version of the config
mkdir -p ${HOME}/workspace
cd ${HOME}/workspace

if [ ! -d dotfiles ]; then # if dir does not exist
    git clone git@github.com:amustafa/dotfiles.git
fi

cd ${HOME}/workspace/dotfiles

touch config.local.ini

# Necessary program folders
mkdir -p ${HOME}/bin
mkdir -p ${HOME}/usr
mkdir -p ${HOME}/opt

PATH_TO_ADD=$HOME/bin:/usr/local/bin
[[ ":$PATH:" != *":${PATH_TO_ADD}:"* ]] && PATH="${PATH_TO_ADD}:${PATH}"

export XDG_CONFIG_HOME="$HOME/.config"

echo "Checking for pyenv ..."
if (which pyenv); then
    # install python (other scripts may be written in python)
    echo "Python found"
    python --version
else
    echo "Installing Python 3 ..."
    cd python
    ./install_python.sh
    cd ..
fi

cd applications
./install.sh
cd ..

cd zsh
./install.sh
cd ..

cd tmux
zsh install.sh
cd ..

cd programming
zsh install.sh
cd ..

if [ "`uname -s`" = Linux ]; then
    cd ubuntu
    zsh install.sh
    cd ..
fi

echo "UPDATE ZSHRC"
