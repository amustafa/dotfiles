# PyEnv plug

if [ -e $PYENV_HOME ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
