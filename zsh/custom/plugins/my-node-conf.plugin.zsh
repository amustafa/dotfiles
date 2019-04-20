########################################
# Node
########################################
if [ -e $NVM_DIR ]; then 

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    export NPM_PACKAGES="${HOME}/.npm-packages"
    export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
    export PATH="$NPM_PACKAGES/bin:$PATH"

    export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
fi
