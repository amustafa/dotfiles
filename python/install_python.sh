# Install pyenv, add to path, build and install python, set python version


export PYENV_ROOT=$HOME/opt/pyenv

if [ $DEPS_INSTALLED = "TRUE" ]; then
    # https://github.com/pyenv/pyenv-installer
    curl https://pyenv.run | bash

    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"

    if [ "`uname -s`" = Linux ]; then
        pyenv install 3.7.4
        pyenv global 3.7.4
        # Instal pyenv virtual env
        pyenv virtualenv 3.7.4 nvim
    else
        pyenv install 3.7.2
        pyenv global 3.7.2
        # Instal pyenv virtual env
        pyenv virtualenv 3.7.2 nvim
    fi


else
    echo "DEPS NOT INSTALLED"
fi

pip install requests
