# Setup fzf
# ---------
# ln -s $FZF_HOME/bin/fzf $HOME/bin
#if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#  export PATH="$PATH:/usr/local/opt/fzf/bin"
#fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.zsh"

