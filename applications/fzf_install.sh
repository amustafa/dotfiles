# Installs fzf into the opt folder

mkdir -p ${HOME}/opt
FZF_BASE=${HOME}/opt/fzf

git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_BASE
$FZF_BASE/install --no-bash --no-fish --no-zsh --64 --no-update-rc

# Add to user bin
ln -s $FZF_BASE/bin/fzf ${HOME}/bin
