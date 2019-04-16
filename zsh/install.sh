export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_CONFIG_HOME="${XDG_CONFIG_HOME}/zsh"

# Install
sudo apt-get install zsh

# Verify
zsh --version

# Install zplug
# export ZPLUG_HOME=$HOME/usr/zplug
source zplug_settings.zsh
mkdir -p $ZPLUG_HOME
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


# Set as default shell
chsh -s $(which zsh)

# Create ZSH config location
ZSH_CONFIG_HOME="${HOME}/.config/zsh"
mkdir -p $ZSH_CONFIG_HOME

# Install oh-my-zsh (outdated)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Move oh my zsh to config home
# mv $HOME/.oh-my-zsh $ZSH_CONFIG_HOME/oh-my-zsh

# Install direnv   https://github.com/direnv/direnv
if [ "`uname -s`" = Linux ]; then
    sudo apt-get install direnv
    sudo apt-get install fzf
    sudo apt-get install silversearcher-ag
    sudo apt-get install git
elif [ "`uname -s`" = Darwin ]; then
    brew install direnv
    brew install fzf
    brew install silversearcher-ag
    brew install git
fi

# Move zshrc
cp custom/zshrc $HOME/.zshrc

# Move custom elements
cp -r custom/my-aliases $ZSH_CONFIG_HOME/.oh-my-zsh/custom/plugins
wget https://raw.githubusercontent.com/ggreer/the_silver_searcher/master/_the_silver_searcher
mv _the_silver_searcher $ZSH_CONFIG_HOME/custom/plugins/the_silver_searcher.plugin.zsh


source ~/.zshrc



