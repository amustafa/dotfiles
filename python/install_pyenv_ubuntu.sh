# Install pyenv, add to path, build and install python, set python version

# Install Prereqs
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
DEPS_INSTALLED=""
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
DEPS_INSTALLED=TRUE

export PYENV_ROOT=$HOME/opt/pyenv

if [ $DEPS_INSTALLED = "TRUE" ]; then
    # https://github.com/pyenv/pyenv-installer
    curl https://pyenv.run | bash

    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"

    pyenv install 3.7.4
    pyenv global 3.7.4
    # Instal pyenv virtual env
    pyenv virtualenv 3.7.4 nvim

    pip install requests
else
    echo "DEPS NOT INSTALLED"
fi
