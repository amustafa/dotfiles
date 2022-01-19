" To convert to neovm: https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html
set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("${XDG_CONFIG_HOME}/nvim")

call plug#begin()

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim'  " Replaced with FZF
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/mru.vim'
Plug 'mileszs/ack.vim' " fast search (settings change to ag)
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-obsession', { 'on': 'Obsess' } " keeps sessions updated once started
Plug 'thaerkh/vim-workspace'

" Plug 'xolox/vim-session'
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'
" Plug 'nathanaelkane/vim-indent-guides'

" snippet manager and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'mtth/scratch.vim'
" Plug 'ludovicchabant/vim-gutentags' " generate tags
Plug 'amix/open_file_under_cursor.vim'
" Plug 'zenbro/mirror.vim' " Mirror files on remote server
" Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim' " utility for other packages
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'tpope/vim-abolish' " replaces commonly mispelled words
" Plug 'marcweber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'  " comment stuff out
Plug 'terryma/vim-expand-region' " select increasingly larger regions
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'  " allows some plugins actions to repeat with .
Plug 'terryma/vim-multiple-cursors'  "sublime-like cursor behavior
Plug 'michaeljsmith/vim-indent-object'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim' " Adds a scratch patch coding interface that executes python

Plug 'dense-analysis/ale'
"Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-yarp'  " Used by deoplete
" Plug 'davidhalter/jedi-vim'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'deoplete-plugins/deoplete-zsh',  { 'for': ['zsh', 'zshrc*'] }
" Plug 'deoplete-plugins/deoplete-clang',  { 'for': ['c', 'cpp', 'cs', 'm'] }

Plug 'itchyny/lightline.vim'
" Plug 'maximbaz/lightline-ale'

Plug 'tmhedberg/SimpylFold', { 'for': 'py' }
Plug 'google/yapf', { 'for': 'py' }
" Plug 'ambv/black', { 'for': 'py' }
Plug 'nvie/vim-flake8', { 'for': 'py' }

Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'moll/vim-node', { 'for': 'js' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'rhysd/vim-fixjson', { 'for': 'json' }

Plug 'lervag/vimtex', { 'for': 'tex' }  " latex edit and compile

Plug 'gu-fan/riv.vim', { 'for': 'rst' }
Plug 'gu-fan/InstantRst', { 'on': 'InstantRst', 'for': 'rst' }

Plug 'tomlion/vim-solidity', { 'for': 'sol' }

Plug 'groenewege/vim-less', { 'for': 'less' }  " syntax for less

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

Plug 'JuliaEditorSupport/julia-vim'

Plug 'plasticboy/vim-markdown', { 'for': 'md' }  " must have tabular before this. Style for Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}


Plug 'aklt/plantuml-syntax', { 'for': 'uml' }

Plug 'tmhedberg/matchit'

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'bfredl/nvim-ipy'
" Plug 'hkupty/iron.nvim'
" Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Plug 'chr4/nginx.vim'
"
" coc.vim requirements
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'puremourning/vimspector'

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

source ~/.config/nvim/vimrcs/plugin_config.vim
try
source ~/.config/nvim/vimrcs/plugin_config.local.vim
catch
endtry

""""""""""""""""""""""""""""""""""""""""'
set exrc
set secure
