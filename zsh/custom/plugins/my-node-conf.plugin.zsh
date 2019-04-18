########################################
# Node
########################################
if (`which node`); then 
    NPM_PACKAGES="${HOME}/.npm-packages"
    NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
    export PATH="$NPM_PACKAGES/bin:$PATH"

    export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

    # nvm 
    if [ -z ${NVM_DIR+x} ]; then 
        export NVM_DIR="$HOME/opt/nvm"
    fi

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi
