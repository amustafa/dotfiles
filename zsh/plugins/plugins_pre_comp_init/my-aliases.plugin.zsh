# Aliases.

alias cat="bat"   # use bat as cat instead of default
alias vim="nvim"
alias zshconfig="vim $ZSH_CONFIG_HOME/zshrc"
alias tmux="TERM=screen-256color-bce tmux"

# ls, the common ones I use a lot shortened for rapid fire usage
# alias l='ls -lFh'     #size,show type,human readable
# alias la='ls -lAFh'   #long list,show almost all,show type,human readable
# alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
# alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
# alias ll='ls -l'      #long list
# alias ldot='ls -ld .*'
# alias lS='ls -1FSsh'
# alias lart='ls -1Fcart'
# alias lrt='ls -1Fcrt'

alias l='exa -lFgh'                   # list, size, show type
alias ll='exa -lBFg'                  # long list
alias lll='exa -lBhgUm@'              # long long list
alias la='exa -lFag'                  # long list, show almost all, show type and hidden
alias lt='exa -lFg --sort=modified'   # list, sorted by modified date, recursive, show type and hidden
alias lr='exa -RFga --sort=modified'   # list, sorted by modified date, recursive, show type and hidden
alias ldot='exa -ld .*'
alias lm='exa -lBdFa --sort=modified' # long list, no recursion, sorted by modified date, show type and hidden
alias lS='exa -1'			          # one list

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} ' # recursive line number with filename print 5 lines


# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g F='| ag'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ff='fd -t f'

alias h='history'
alias hgrep="fc -El 0 | ag"
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

#read documents
if [ "$(uname -s)" = "Darwin" ]; then
    alias o='open'
else
    alias o='xdg-open'
    alias trash='gio trash'
fi

# open browser on urls
if [[ -n "$BROWSER" ]]; then
    export $BROWSER=o
fi
_browser_fts=(htm html de org net com at cx nl se dk)
for ft in $_browser_fts; do alias -s $ft=$BROWSER; done

# open files an editors
_editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex py js conf)
for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

# open images
if [[ -n "$XIVIEWER" ]]; then
    export $XIVIEWER=o
fi
_image_fts=(jpg jpeg png gif mng tiff tif xpm)
for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done

if [[ -n "$XIMEDIAPLAYER" ]]; then
    export $XIMEDIAPLAYER=mplayer
fi
# open media files
_media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
for ft in $_media_fts; do alias -s $ft=$XIMEDIAPLAYER; done

alias -s pdf=o
alias -s ps=o
alias -s dvi=o
alias -s chm=o
alias -s djvu=o

#list whats inside packed file
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


# Python
alias pip="python -m pip"

# Git
alias gcob="git checkout -b"
