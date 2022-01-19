# PyEnv plug

if [ -d $PYENV_ROOT ]; then
    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init --path)"
fi
