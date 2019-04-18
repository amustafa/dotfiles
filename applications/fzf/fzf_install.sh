# Installs fzf into the opt folder

mkdir -p ${HOME}/opt
FZF_HOME=${HOME}/opt/fzf

git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_HOME
~/.fzf/install --no-bash --no-fish --64

mv ${HOME}/.fzf $FZF_HOME

# Add to user bin
ln -s $FZF_HOME/bin/fzf ${HOME}/bin

echo $FZF_HOME >> .zshrc.local
