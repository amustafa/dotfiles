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
" :noremap <c-p> :lua require('fzf-lua').files()<cr>
" :noremap <c-b> :lua require('fzf-lua').buffers()<cr>
" :noremap <c-f> :lua require('fzf-lua').live_grep()<cr>



""""""""""""""""""""""""""""""
" => LuaSnip
""""""""""""""""""""""""""""""
" lua require("luasnip.loaders.from_vscode").lazy_load()
lua <<EOF
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...
   ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<C-l>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-h>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

  -- ... Your other configuration ...
})
EOF

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
lua <<EOF
require("mason").setup({
  ensure_installed = {
      "gopls",
  },
})
require("mason-lspconfig").setup()
EOF




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
      { name = "cody" },
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })



  -- require'lspconfig'.golangci_lint_ls.setup{}
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
  require'lspconfig'.buf_ls.setup{}

  -- dockerls
  require'lspconfig'.dockerls.setup{}



  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }

require('litee.lib').setup({
    tree = {
        icon_set = "codicons"
    },
    panel = {
        orientation = "left",
        panel_size  = 30
    }
})
require("litee.gh").setup()
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


lua <<EOF
require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
EOF



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
let g:go_fmt_command = "goimports -local"

lua <<EOF
require('go').setup({

  disable_defaults = false, -- true|false when true set false to all boolean settings and replace all tables
  -- settings with {}; string will be set to ''. user need to setup ALL the settings
  -- It is import to set ALL values in your own config if set value to true otherwise the plugin may not work
  max_line_len = 0, -- max line length in golines format, Target maximum line length for golines
  tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
  lsp_semantic_highlights = true, -- use highlights from gopls
  lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
                   -- false: do nothing
                   -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
                   -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
                      -- false: do not set default gofmt in gopls format to gofumpt
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
                       --      when lsp_cfg is true
                       -- if lsp_on_attach is a function: use this function as on_attach function for gopls
  lsp_keymaps = true,  -- set to false to disable gopls/lsp keymap
  lsp_codelens = true,  -- set to false to disable codelens, true by default, you can use a function
                        -- function(bufnr)
                        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
                        -- end
                        -- to setup a table of codelens
  null_ls = {           -- set to false to disable null-ls setup
    golangci_lint = {
      method = {"NULL_LS_DIAGNOSTICS_ON_SAVE", "NULL_LS_DIAGNOSTICS_ON_OPEN"}, -- when it should run
      -- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
      -- enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
      severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
    },
  },
  diagnostic = {  -- set diagnostic to false to disable vim.diagnostic.config setup,
                  -- true: default nvim setup
    hdlr = false, -- hook lsp diag handler and send diag to quickfix
    underline = true,
    virtual_text = { spacing = 2, prefix = '' }, -- virtual text setup
    signs = {'', '', '', ''},  -- set to true to use default signs, an array of 4 to specify custom signs
    update_in_insert = false,
  },
  -- if you need to setup your ui for input and select, you can do it here
  -- go_input = require('guihua.input').input -- set to vim.ui.input to disable guihua input
  -- go_select = require('guihua.select').select -- vim.ui.select to disable guihua select
  lsp_document_formatting = true,
  -- set to true: use gopls to format
  -- false if you want to use other formatter tool(e.g. efm, nulls)
  lsp_inlay_hints = {
    enable = true, -- this is the only field apply to neovim > 0.10

   -- following are used for neovim < 0.10 which does not implement inlay hints
   -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
    style = 'inlay',
    -- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
    -- Only show inlay hints for the current line
    only_current_line = false,
    -- Event which triggers a refersh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = "CursorHold",
    -- whether to show variable name before type hints with the inlay hints or not
    -- default: false
    show_variable_name = true,
    -- prefix for parameter hints
    parameter_hints_prefix = "󰊕 ",
    show_parameter_hints = true,
    -- prefix for all the other hints (type, chaining)
    other_hints_prefix = "=> ",
    -- whether to align to the length of the longest line in the file
    max_len_align = false,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 6,
    -- The color of the hints
    highlight = "Comment",
  },
  gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
  gopls_remote_auto = true, -- add -remote=auto to gopls
  gocoverage_sign = "█",
  sign_priority = 5, -- change to a higher number to override other signs
  dap_debug = true, -- set to false to disable dap
  dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
                           -- false: do not use keymap in go/dap.lua.  you must define your own.
                           -- Windows: Use Visual Studio keymap
  dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
  dap_debug_vt = { enabled = true, enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

  dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
  dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
  dap_retries = 20, -- see dap option max_retries
  dap_enrich_config = nil, -- see dap option enrich_config
  textobjects = true, -- enable default text objects through treesittter-text-objects
  test_runner = 'go', -- one of {`go`,  `dlv`, `ginkgo`, `gotestsum`}
  verbose_tests = true, -- set to add verbose flag to tests deprecated, see '-v' option
  run_in_floaterm = false, -- set to true to run in a float window. :GoTermClose closes the floatterm
                           -- float term recommend if you use gotestsum ginkgo with terminal color

  floaterm = {   -- position
    posititon = 'auto', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
    width = 0.45, -- width of float window if not auto
    height = 0.98, -- height of float window if not auto
    title_colors = 'nord', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
                              -- can also set to a list of colors to define colors to choose from
                              -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
  },
  trouble = false, -- true: use trouble to open quickfix
  test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
  luasnip = true, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
  --  Do not enable this if you already added the path, that will duplicate the entries
  on_jobstart = function(cmd) _=cmd end, -- callback for stdout
  on_stdout = function(err, data) _, _ = err, data end, -- callback when job started
  on_stderr = function(err, data)  _, _ = err, data  end, -- callback for stderr
  on_exit = function(code, signal, output)  _, _, _ = code, signal, output  end, -- callback for jobexit, output : string
  iferr_vertical_shift = 4 -- defines where the cursor will end up vertically from the begining of if err statement
})
EOF
lua require("go.format").goimports()  -- goimports + gofmt

autocmd BufWritePre *.go :silent! lua require('go.format').goimports()
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
lua require'lspconfig'.gopls.setup{}
lua require("nvim-dap-virtual-text").setup()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim goimports
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goimports_local = 'github.com/FinTronners'


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gp.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require("gp").setup()
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => sg.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua <<EOF
" require("sg").setup()
" EOF


lua <<EOF
require'navigator'.setup()
require'pipeline'.setup()
require"octo".setup()
require"fzf-lua".setup()

require('claude-code').setup()
require("supermaven-nvim").setup({})
require("copilot").setup({})
require('avante').setup()
require('snacks').setup({
    bigfile = {
      notify = true, -- show notification when big file detected
      size = 1.5 * 1024 * 1024, -- 1.5MB
      line_length = 1000, -- average line length (useful for minified files)
      -- Enable or disable features when big file detected
      ---@param ctx {buf: number, ft:string}
      setup = function(ctx)
        if vim.fn.exists(":NoMatchParen") ~= 0 then
          vim.cmd([[NoMatchParen]])
        end
        Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ctx.buf) then
            vim.bo[ctx.buf].syntax = ctx.ft
          end
        end)
      end,
    },
    indent = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    input = {
      icon = " ",
      icon_hl = "SnacksInputIcon",
      icon_pos = "left",
      prompt_pos = "title",
      win = { style = "input" },
      expand = true,
    },
    image = {
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        "mp4",
        "mov",
        "avi",
        "mkv",
        "webm",
        "pdf",
      },
      force = false, -- try displaying the image, even if the terminal does not support it
      doc = {
        -- enable image viewer for documents
        -- a treesitter parser must be available for the enabled languages.
        enabled = true,
        -- render the image inline in the buffer
        -- if your env doesn't support unicode placeholders, this will be disabled
        -- takes precedence over `opts.float` on supported terminals
        inline = true,
        -- render the image in a floating window
        -- only used if `opts.inline` is disabled
        float = true,
        max_width = 80,
        max_height = 40,
        -- Set to `true`, to conceal the image text when rendering inline.
        -- (experimental)
        ---@param lang string tree-sitter language
        ---@param type snacks.image.Type image type
        conceal = function(lang, type)
          -- only conceal math expressions
          return type == "math"
        end,
      },
      img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
      -- window options applied to windows displaying image buffers
      -- an image buffer is a buffer with `filetype=image`
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
        spell = false,
        statuscolumn = "",
      },
      cache = vim.fn.stdpath("cache") .. "/snacks/image",
      debug = {
        request = false,
        convert = false,
        placement = false,
      },
      env = {},
      -- icons used to show where an inline image is located that is
      -- rendered below the text.
      icons = {
        math = "󰪚 ",
        chart = "󰄧 ",
        image = " ",
      },
      ---@class snacks.image.convert.Config
      convert = {
        notify = true, -- show a notification on error
        ---@type snacks.image.args
        mermaid = function()
          local theme = vim.o.background == "light" and "neutral" or "dark"
          return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
        end,
        ---@type table<string,snacks.image.args>
        magick = {
          default = { "{src}[0]", "-scale", "1920x1080>" }, -- default for raster images
          vector = { "-density", 192, "{src}[0]" }, -- used by vector images like svg
          math = { "-density", 192, "{src}[0]", "-trim" },
          pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
        },
      },
      math = {
        enabled = true, -- enable math expression rendering
        -- in the templates below, `${header}` comes from any section in your document,
        -- between a start/end header comment. Comment syntax is language-specific.
        -- * start comment: `// snacks: header start`
        -- * end comment:   `// snacks: header end`
        typst = {
          tpl = [[
            #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
            #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
            #set text(size: 12pt, fill: rgb("${color}"))
            ${header}
            ${content}]],
        },
        latex = {
          font_size = "Large", -- see https://www.sascha-frank.com/latex-font-size.html
          -- for latex documents, the doc packages are included automatically,
          -- but you can add more packages here. Useful for markdown documents.
          packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
          tpl = [[
            \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
            \usepackage{${packages}}
            \begin{document}
            ${header}
            { \${font_size} \selectfont
              \color[HTML]{${color}}
            ${content}}
            \end{document}]],
        },
      },
    }
})
EOF
" require("dbee").setup()
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => harpoon
" https://github.com/ThePrimeagen/harpoon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
EOF
