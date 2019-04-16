# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
#
# sudo: esc-esc will insert sudo in front of command
# copybuffer: binds the ctrl-o keyboard shortcut to a command that copies currently typed text
# copydir:  Copies the pathname of the current directory
# cp: provides cpv command that uses rsync
# command-not-found: suggests something in apt if command not found
# bgnotify: notifications for long running commands
# extract:  extracts the archive file you pass it, and it supports a wide variety of archive filetypes.
# jsontools: tools for jsondata
# vi-mode: This plugin increase vi-like zsh functionality.
# colorize: colorize_via_pygmentize
# compleat: 
#       Generate tab completion for any shell command by specifying its usage in a familiar 
#       manpage-like format.
# globalias: Expands all glob expressions, subcommands and aliases (including global).
# last-working-directory: keeps track of the last directory and lwd to it


#MY PLUGINS
	# my-aliases

basic_plugins=(my-aliases sudo copybuffer copydir copyfile cp compleat globalias command-not-found bgnotify extract jsontools vi-mode urltools last-working-directory colorize fancy-ctrl-z)


# nmap: nmap aliases plugin
# httpie: add completion for httpie
# rsync: tab completion + aliases
application_plugins=(tmux nmap docker taskwarrior httpie rsync fzf direnv)
ubuntu_plugins=(java)
mac_plugins=(brew)

# autopep8: tab completion file
# pep8: tab completion file
# pip: tab completion file
# celery: tab completion file
programming_plugins=(git github gitignore autopep8 pep8 pylint pip node npm)

# golang: adds completion for go
language_plugins=(golang)


###### Assemble Plugins #########
plugins=(basic_plugins application_plugins programming_plugins language_plugins)
if [ "`uname -s`" = Linux ]; then
	plugins=(plugins ubuntu_plugins)
elif [ "`uname -s`" = Darwin ]; then
	plugins=(plugins mac_plugins)
fi
