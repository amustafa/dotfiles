:let g:session_autosave = 'no'

let g:tmux_navigator_disable_when_zoomed = 1


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => Indent Guides
""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 0

" let g:ctrlp_map = '<c-p>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>

" let g:ctrlp_max_height = 20

" let g:ctrlp_user_command = 'ag %s -l --ignore .git --nocolor --hidden -g ""'

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
" let $FZF_DEFAULT_COMMAND = 'ag -l --ignore .git --nocolor --hidden -g ""'
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

:noremap <c-p> :Files<cr>
:noremap <c-b> :Buffers<cr>
:noremap <c-f> :Rg<cr>


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => LuaSnip
""""""""""""""""""""""""""""""
lua require("luasnip.loaders.from_vscode").lazy_load()

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowHidden=0
" let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$'] "ignore files in NERDTree
" let g:NERDTreeWinSize=35
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>

" If previous buffer was NERDTree, go back to it.
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" Automatically close if NerdTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nvim Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NvimTreeToggle<cr>
map <leader>nf :NvimTreeFindFile<cr>

lua <<EOF
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    side = "left",
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spectre
" https://github.com/nvim-pack/nvim-spectre
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
"
lua require('spectre').setup()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CHAD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:chadtree_settings = {
"     \ "view.open_direction": "right",
"     \ "view.width": 35,
"     \ }
" map <leader>nn :CHADopen<cr>

" " If previous buffer was NERDTree, go back to it.
" autocmd BufEnter * if bufname('#') =~# "^CHAD_tree_" | b# | endif

" " Automatically close if CHADTree is last buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:CHADTree") && b:CHADTree.isTabTree()) | q | endif
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spellsitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require('spellsitter').setup()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = true, -- DO NOT SET THIS
      ensure_installed = { 'go', 'gomod', 'gosum', 'gowork', 'graphql', 'gitcommit', 'git_rebase', 'gitattributes','lua', 'python', 'rust', 'typescript', 'javascript', 'vim', 'help', 'cmake', 'make', 'terraform', 'json', 'html', 'css', 'bash', 'dockerfile',  'latex', 'markdown', 'markdown_inline', 'proto', 'ql', 'query', 'rust',  'toml',  'yaml'},
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hop.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'hop'.setup()

vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
EOF



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COQ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:coq_settings = { 'auto_start': v:true }
" let g:coq_settings = {
"             \ 'auto_start': 'shut-up',
"             \ 'keymap': {
"                 \ 'repeat': '<c-.>',
"                 \ 'jump_to_mark': '<c-d>',
"               \}
"             \}
" lua require("coq")
"
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mason
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require("mason").setup()
lua require("mason-lspconfig").setup()




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-cmp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect

" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })



  require'lspconfig'.golangci_lint_ls.setup{}
  require'lspconfig'.gopls.setup{}
  require'lspconfig'.graphql.setup{}



  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  --  yamlls
  require('lspconfig').yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
        },
      },
    }
  }

  --  bashls
  require('lspconfig').bashls.setup{}

  -- bufls
  require'lspconfig'.bufls.setup{}

  -- dockerls
  require'lspconfig'.dockerls.setup{}



  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
EOF



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-dap-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('dap-go').setup()
nmap <silent> <leader>td :lua require('dap-go').debug_test()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"
"
" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = "\ue206"
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
let g:lightline#ale#indicator_ok = "\uf00c  "

" g:lightline#ale#indicator_checking
" The indicator to use when ALE is in progress. Default is Linting....

" g:lightline#ale#indicator_warnings
" The indicator to use when there are warnings. Default is W:.

" g:lightline#ale#indicator_errors
" The indicator to use when there are errors. Default is E:.

" g:lightline#ale#indicator_ok
" The indicator to use when there are no warnings or errors. Default is OK.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:go_fmt_command = "goimports"
lua require('go').setup()
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
lua require'lspconfig'.gopls.setup{}
lua require("nvim-dap-virtual-text").setup()





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'go': ['gopls', 'golint', 'errcheck'],
\   'proto': ['buf-lint'],
\}

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '-'

nmap <silent> <leader>a <Plug>(ale_next_wrap)

let g:ale_emit_conflict_warnings = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1 " keeps sign gutter open
"
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf'],
\   'javascript': ['eslint'],
\   'go': ['goimports'],
\   'proto': ['buf-format'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>diff :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-config-local
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require('config-local').setup {
  -- Default configuration (optional)
  config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
  hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  silent = false,                             -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false,                     -- Lookup config files in parent directories
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips (snippet endinge)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commentary (comment stuff out)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType apache setlocal commentstring=#\ %s  " to adjust comment string


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SimpylFold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View docstring for folded code
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_progname = 'nvr'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufferline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua  require("bufferline").setup{}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>rn"
" let g:jedi#completions_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete/jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1
""
"" Changes the autocompletion selector to tab
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IronRepl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " deactivate default mappings
" let g:iron_map_defaults=0
" " define custom mappings for the python filetype
" augroup ironmapping
"     autocmd!
"     autocmd Filetype python nmap <buffer> <localleader>t <Plug>(iron-send-motion)
"     autocmd Filetype python vmap <buffer> <localleader>t <Plug>(iron-send-motion)
"     "autocmd Filetype python nmap <buffer> <localleader>p <Plug>(iron-repeat-cmd)  " conflicts with error checking
" augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabnine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

" lua  <<EOF
" require('tabnine').setup({
"  disable_auto_comment=true,
"  accept_keymap="<Tab>",
"  dismiss_keymap = "<C-]>",
"  debounce_ms = 800,
"  suggestion_color = {gui = "#808080", cterm = 244},
"  exclude_filetypes = {"TelescopePrompt"}
" })
" EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ChatGPT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require("chatgpt").setup({
  welcome_message = WELCOME_MESSAGE,
  loading_text = "loading",
  question_sign = "", -- you can use emoji if you want e.g. 🙂
  answer_sign = "ﮧ", -- 🤖
  max_line_length = 120,
  yank_register = "+",
  chat_layout = {
    relative = "editor",
    position = "50%",
    size = {
      height = "80%",
      width = "80%",
    },
  },
  settings_window = {
    border = {
      style = "rounded",
      text = {
        top = " Settings ",
      },
    },
  },
  chat_window = {
    filetype = "chatgpt",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " ChatGPT ",
      },
    },
  },
  chat_input = {
    prompt = "  ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
  },
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "<C-c>" },
    submit = "<C-Enter>",
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<Tab>",
    -- in the Sessions pane
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
  },
})
EOF
