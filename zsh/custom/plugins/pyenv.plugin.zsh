# PyEnv plug

if (`which pyenv`); then
    echo 'pyenv installed'
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
