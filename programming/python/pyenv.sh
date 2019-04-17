# https://github.com/pyenv/pyenv/wiki/Common-build-problems
if [ "`uname -s`" = Linux ]; then
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
elif [ "`uname -s`" = Darwin ]; then
    brew install readline xz
fi

# https://github.com/pyenv/pyenv-installer
curl https://pyenv.run | bash

export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.7.3
