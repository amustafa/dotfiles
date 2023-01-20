" To convert to neovm: https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html
set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("${XDG_CONFIG_HOME}/nvim")


call plug#begin()

" Nerdtree
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': '/home/amustafa/.asdf/shims/python -m chadtree deps'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim'  " Replaced with FZF
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/mru.vim'
Plug 'mileszs/ack.vim' " fast search (settings change to ag)
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-obsession', { 'on': 'Obsess' } " keeps sessions updated once started
Plug 'thaerkh/vim-workspace'

" Plug 'xolox/vim-session'
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'
" Plug 'nathanaelkane/vim-indent-guides'

" snippet manager and snippets
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'mtth/scratch.vim'
" Plug 'ludovicchabant/vim-gutentags' " generate tags
Plug 'amix/open_file_under_cursor.vim'
" Plug 'zenbro/mirror.vim' " Mirror files on remote server
" Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim'  " utility for other packages
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'tpope/vim-abolish' " replaces commonly mispelled words
Plug 'lewis6991/spellsitter.nvim'
" Plug 'marcweber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'  " comment stuff out
Plug 'terryma/vim-expand-region' " select increasingly larger regions
Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'tpope/vim-surround'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-repeat'  " allows some plugins actions to repeat with .
Plug 'terryma/vim-multiple-cursors'  "sublime-like cursor behavior
Plug 'michaeljsmith/vim-indent-object'
Plug 'airblade/vim-gitgutter'
" Plug 'easymotion/vim-easymotion'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'tpope/vim-dispatch'
Plug 'metakirby5/codi.vim' " Adds a scratch patch coding interface that executes python
Plug 'ray-x/guihua.lua' " recommended if need floating window support
Plug 'phaazon/hop.nvim' " easy motions
Plug 'windwp/nvim-spectre' " find and replace
Plug 'klen/nvim-config-local' " local neovim config files


Plug 'w0rp/ale'
"Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'janko/vim-test'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-yarp'  " Used by deoplete
" Plug 'davidhalter/jedi-vim'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'deoplete-plugins/deoplete-zsh',  { 'for': ['zsh', 'zshrc*'] }
" Plug 'deoplete-plugins/deoplete-clang',  { 'for': ['c', 'cpp', 'cs', 'm'] }

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

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

" Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' "; recommended if need floating window support

Plug 'plasticboy/vim-markdown', { 'for': 'md' }  " must have tabular before this. Style for Markdown

Plug 'bufbuild/vim-buf' " protobuf

Plug 'chrisbra/matchit'

Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'bfredl/nvim-ipy'
" Plug 'hkupty/iron.nvim'
" Plug 'chr4/nginx.vim'

Plug 'neovim/nvim-lspconfig' " https://github.com/neovim/nvim-lspconfig

Plug 'buoto/gotests-vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " fuzzy finder


Plug 'williamboman/mason.nvim' " markdown lsp
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'jparise/vim-graphql'


"
" dap plugins
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-lua/plenary.nvim'
" Plug 'yriveiro/dap-go.nvim'
Plug 'leoluz/nvim-dap-go'
Plug 'theHamsta/nvim-dap-virtual-text'


" coc.vim requirements
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" main one
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}  " 9000+ Snippets

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
"

" nvim-cmp recommended
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

call plug#end()  " Initialize plugin system

command! Scratch2 lua require'tools'.makeScratch()



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
