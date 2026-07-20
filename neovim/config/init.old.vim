" To convert to neovm: https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html
set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("${XDG_CONFIG_HOME}/nvim")


""" Load Plugins """""""""""

source ~/.config/nvim/vimrcs/plugins.vim
try
source ~/.config/nvim/vimrcs/plugins.local.vim
catch
endtry


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
