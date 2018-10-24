# Install
sudo apt-get install zsh

# Verify
zsh --version

# Set as default shell
chsh -s $(which zsh)


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install autoenv
#git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv

#sudo apt-get install autojump
#sudo pip install autenv

#sudo pip install --upgrade autopep8
#sudo apt-get install taskwarrior
#sudo pip install bugwarrior

# Move custom elements
mv custom/zshrc $HOME/.zshrc
mv custom/my-aliases ~/.oh-my-zsh/custom/plugins

source ~/.zshrc

