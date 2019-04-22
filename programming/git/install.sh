if [ ! -e $HOME/.gitconfig ]; then
    cp gitconfig $HOME/.gitconfig
else
    echo "git config already exists
fi
