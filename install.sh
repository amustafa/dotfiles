# Ensures a local version of the config
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
    ./programming/python/install_python.sh
fi

if [[ "`python --version`" == "Python 3"* ]]; then
    python installer.py
else
    echo "Wrong Version of Python"
fi



