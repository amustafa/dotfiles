# PyEnv plug

if (`which pyenv`); then
    echo 'pyenv installed'
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
else 
    echo "pyenv not installed"
    echo `which pyenv`
    echo "pyenv not installed"
fi
