# PyEnv plug

if [ -d $PYENV_ROOT ]; then 
    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
