#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

if [ -z ${NVM_DIR+x} ]; then
    echo "NVM_DIR not set"
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    # git clone https://github.com/creationix/nvm.git "$NVM_DIR"
      # cd "$NVM_DIR"
      # git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    # \. "$NVM_DIR/nvm.sh"
    # sudo apt-get install nodejs
    # sudo apt-get install npm
    # https://github.com/creationix/nvm
fi
