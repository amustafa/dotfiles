# PyEnv plug

echo "Looking at pyenv"
if [ -d $PYENV_ROOT ]; then 
    echo "loading at pyenv"
    export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
