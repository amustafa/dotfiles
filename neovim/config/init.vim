" To convert to neovm: https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html
set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("${XDG_CONFIG_HOME}/nvim")

call plug#begin()

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession', { 'on': 'Obsess' } " keeps sessions updated once started
" Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'
Plug 'tmhedberg/SimpylFold'
Plug 'mileszs/ack.vim' " fast search (settings change to ag)

" snippet manager and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'jlanzarotta/bufexplorer'
Plug 'xolox/vim-colorscheme-switcher'

Plug 'amix/open_file_under_cursor.vim'
" Plug 'zenbro/mirror.vim' " Mirror files on remote server
Plug 'tomtom/tlib_vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish' " replaces commonly mispelled words
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'  " comment stuff out
Plug 'terryma/vim-expand-region' " select increasingly larger regions
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'  " allows some plugins actions to repeat with .
Plug 'terryma/vim-multiple-cursors'  "sublime-like cursor behavior
Plug 'michaeljsmith/vim-indent-object' 
Plug 'airblade/vim-gitgutter'
Plug 'gu-fan/riv.vim', { 'for': 'rst' }
Plug 'gu-fan/InstantRst', { 'on': 'InstantRst', 'for': 'rst' }
" Plug 'tpope/vim-eunuch' " Adds unix commands like delete and mv
Plug 'lervag/vimtex', { 'for': 'tex' }  " latex edit and compile

Plug 'w0rp/ale'
"Plug 'neomake/neomake'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-yarp'  " Used by deoplete
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-zsh',  { 'for': ['zsh', 'zshrc*'] }
Plug 'deoplete-plugins/deoplete-clang',  { 'for': ['c', 'cpp', 'cs', 'm'] }

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
" Plug 'bfredl/nvim-ipy'
" Plug 'hkupty/iron.nvim'

" Language Specific formatters and syntax highlighters
Plug 'google/yapf', { 'for': 'py' }
Plug 'ambv/black', { 'for': 'py' }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'chr4/nginx.vim'
Plug 'tomlion/vim-solidity', { 'for': 'sol' }
Plug 'groenewege/vim-less', { 'for': 'less' }  " syntax for less
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nvie/vim-flake8', { 'for': 'py' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }  " must have tabular before this. Style for Markdown

call plug#end()  " Initialize plugin system


""" Load Configs """""""""""

source ~/.config/nvim/vimrcs/config.vim
try
source ~/.config/nvim/vimrcs/config.local.vim
catch
endtry

source ~/.config/nvim/vimrcs/filetypes.vim
try
source ~/.config/nvim/vimrcs/filetypes.local.vim
catch
endtry

source ~/.config/nvim/vimrcs/plugins_config.vim
try
source ~/.config/nvim/vimrcs/plugins_config.local.vim
catch
endtry

""""""""""""""""""""""""""""""""""""""""'
set exrc
set secure
