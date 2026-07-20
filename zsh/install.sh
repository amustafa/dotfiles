# Set default env vars
echo "Setting Environment vars"
if [ -z ${XDG_CONFIG_HOME+x} ]; then  # if var is unset
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z ${ZSH_CONFIG_HOME+x} ]; then
    export ZSH_CONFIG_HOME="${XDG_CONFIG_HOME}/zsh"
fi

export ANTIDOTE_DIR=$HOME/.antidote

# Install ZSH
if (which zsh); then
    echo "ZSH  already installed"
else
    echo "Installing application"
    if [ "`uname -s`" = Linux ]; then
        sudo apt-get install zsh
    elif [ "`uname -s`" = Darwin ]; then
        brew install zsh
    fi
fi

# Verify
zsh --version

# Install antidote

if [ ! -e "$ANTIDOTE_DIR" ]; then
    echo "Installing Antidote"
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
else
    echo "Antidote already installed"
fi

# Set as default shell
echo $ZSH_NAME
if [ -z ${ZSH_NAME+x} ]; then
    chsh -s $(which zsh)
else
    echo "Zsh is already current shell"
fi

# Create ZSH config location
mkdir -p $ZSH_CONFIG_HOME


# Install direnv   https://github.com/direnv/direnv
if (command -v ag); then
    echo "Apps already installed"
else
    if [ "`uname -s`" = Linux ]; then
        sudo apt-get install direnv
        sudo apt-get install fzf
        sudo apt-get install git
    elif [ "`uname -s`" = Darwin ]; then
        brew install direnv
        brew install fzf
        brew install git
    fi
fi

# Move zshrc
if [ ! -e $ZSH_CONFIG_HOME ]; then
    ln -s `pwd`/config $ZSH_CONFIG_HOME
else
    echo "Files already there, update manually"
fi

if [ ! -e $HOME/.zshrc ]; then
    ln -s $ZSH_CONFIG_HOME/config/zshrc $HOME/.zshrc
else
    echo ".zshrc is already there, update manually"
fi






