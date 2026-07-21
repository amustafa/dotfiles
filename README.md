# System Installation and Configuration

The installer prompts `[y/N]` before **each** install, so run it in an interactive
terminal (clone first — piping into `sh` is non-interactive and skips everything):

```sh
git clone git@github.com:amustafa/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
bash install.sh
```

Environment overrides for unattended runs:

* `ASSUME_YES=1 bash install.sh` — accept every prompt (install everything)
* `ASSUME_NO=1 bash install.sh` — decline every prompt

Individual installers can be run the same way, e.g. `ASSUME_YES=1 bash applications/eza_install.sh`.
Anything already installed is detected and skipped without prompting.

# Effects

Adds `usr`, `opt`, and `bin` to $HOME:
* `bin` is for binaries, usually soft links
* `opt` is for command line and system type files and applications
* `usr` is for user applications intended to be accessed directly

All config files are placed in `.config`.

## Install Python
    Language runtimes (python, node, rust, java) are managed by asdf, which is
    installed first. Python is installed at the latest version via `asdf install python latest`.

## Common Install
located @ common_install.txt
* bat: better cat (https://github.com/sharkdp/bat)
* ack: better grep (https://beyondgrep.com/)
* fzf: command fuzzy finder (https://github.com/junegunn/fzf)
* autojump: cd command that learns (https://github.com/wting/autojump)
* httpie: command line HTTP client (https://httpie.org/)


## Ubuntu

Installs necessary ubuntu packages, indicators, and settings.

## Zsh

## Tmux

## neovim
