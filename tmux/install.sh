# Tmux Installer

# Install Tmux
if (which tmux); then
    echo "Tmux already installed"
else
    echo "Installing application"
    if [ "`uname -s`" = Linux ]; then
        sudo apt-get install tmux
    elif [ "`uname -s`" = Darwin ]; then
        brew install tmux
        brew install reattach-to-user-namespace
    fi
fi

# Set default environment variables
echo "Setting Environment vars"
if [ -z ${XDG_CONFIG_HOME+x} ]; then  # if var is unset
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z ${AM_TMUX_CONFIG_HOME+x} ]; then
    export AM_TMUX_CONFIG_HOME="${XDG_CONFIG_HOME}/tmux"
fi

# Clone tpm into the .tmux folder
if [ -e ~/.tmux/plugins/tpm ]; then
    echo "tpm already installed"
else
    echo "Installing tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mkdir -p $AM_TMUX_CONFIG_HOME

# Copy gpabosz tmux conf
if [ -e ~/.tmux/plugins/tpm ]; then
    echo "Copying gpakosz tmux conf"
    curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf |
        sed "s@~/.tmux.conf.local@${AM_TMUX_CONFIG_HOME}/tmux.conf.local@g" |
        sed "s@~/.tmux.conf@${AM_TMUX_CONFIG_HOME}/tmux.conf@g"  > $AM_TMUX_CONFIG_HOME/gpakosz.tmux.conf
fi

# Copy config files
echo "Copying config files"
cp tmux/* $AM_TMUX_CONFIG_HOME

# link to expected location
if [ ! -e  $HOME/.tmux.conf ]; then
    echo "Linking .tmux.conf to home"
    ln -s $AM_TMUX_CONFIG_HOME/tmux.conf $HOME/.tmux.conf
else
    echo ".tmux already exists, replace manually"
fi
