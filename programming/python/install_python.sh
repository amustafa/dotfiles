# Install pyenv, add to path, build and install python, set python version

# Install Prereqs
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
DEPS_INSTALLED=""
if [ "`uname -s`" = Linux ]; then
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
    DEPS_INSTALLED=TRUE
elif [ "`uname -s`" = Darwin ]; then
    brew install readline xz
    # sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
    DEPS_INSTALLED=TRUE
fi

export PYENV_ROOT=$HOME/opt/pyenv

if [ $DEPS_INSTALLED = "TRUE" ]; then
    # https://github.com/pyenv/pyenv-installer
    curl https://pyenv.run | bash

    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"

    if [ "`uname -s`" = Linux ]; then
        pyenv install 3.7.3
        pyenv global 3.7.3
        # Instal pyenv virtual env
        pyenv virtualenv 3.7.3 nvim
    else
        pyenv install 3.7.2
        pyenv global 3.7.2
        # Instal pyenv virtual env
        pyenv virtualenv 3.7.2 nvim
    then


else
    echo "DEPS NOT INSTALLED"
fi

pip install requests
