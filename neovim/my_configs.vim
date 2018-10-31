
:let g:session_autoload = 'no'

" use jk in insert mode for esc
imap jk <Esc>

set foldmethod=indent
set foldlevel=99
set nu
set clipboard=unnamed
set noswapfile
set relativenumber
set number

:nnoremap <C-LEFT> :tabp<ENTER>
:nnoremap <C-RIGHT> :tabn<ENTER>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Terminal
:tnoremap <Esc> <C-\><C-n>


