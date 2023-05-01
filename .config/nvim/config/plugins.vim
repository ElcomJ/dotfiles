let mapleader = "\<Space>"


" Bufferline

lua << END
  require("bufferline").setup{}
END

nnoremap <silent> bs :BufferLinePick<CR>
nnoremap <silent> bp :BufferLineTogglePin<CR>


" Hop

lua << END
  require("hop").setup{}
END

nnoremap <silent> / :HopWord<CR>
vnoremap <silent> / <cmd>HopWord<CR>
nnoremap <silent> \ :HopLine<CR>
vnoremap <silent> \ <cmd>HopLine<CR>


" Indent Blankline

lua << END
  require("indent_blankline").setup{
    filetype = { "rust", "c", "cpp", "go" },
    show_trailing_blankline_indent = false,

    context_patterns = {
      "class", "return", "function", "method", "^if",
      "^while", "^for", "^object", "^table", "block",
      "arguments", "if_statement", "else_clause", "try_statement",
      "catch_clause", "import_statement", "operation_type"
    },
  }
END


" Crates-nvim

lua << END
  require('crates').setup()
END

nnoremap <leader>cv :lua require('crates').show_versions_popup()<CR>
nnoremap <leader>cf :lua require('crates').show_features_popup()<CR>
nnoremap <leader>cd :lua require('crates').show_dependencies_popup()<CR>

nnoremap <silent> . :call <SID>show_documentation_crates()<CR>

function! s:show_documentation_crates()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (index(['man'], &filetype) >= 0)
        execute 'Man '.expand('<cword>')
    elseif (expand('%:t') == 'Cargo.toml' && luaeval('require("crates").popup_available()'))
        lua require('crates').show_popup()
    else
        lua vim.lsp.buf.hover()
    endif
endfunction


" Neoclip

lua << END
  require('neoclip').setup{
    default_register = '"'
  }
END


" COC

let g:coc_global_extensions = [
\  'coc-explorer',
\  'coc-prettier',
\  'coc-rust-analyzer',
\  'coc-go',
\  'coc-clangd'
\]

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-a> :CocCommand explorer<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> cd :CocDiagnostics<CR>

nnoremap <silent> ac <Plug>(coc-codeaction-cursor)
vnoremap <silent> as <Plug>(coc-codeaction-selected)
nnoremap <silent> fj <Plug>(coc-float-jump)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> rn <Plug>(coc-rename)

nnoremap <silent> ; :call <SID>show_documentation_coc()<CR>

function! s:show_documentation_coc()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   else
     call CocAction('doHover')
   endif
endfunction

autocmd FileType qf setlocal nonu nornu cc= scl=no
hi QuickFixLine ctermbg=NONE

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" ALE

let g:ale_fixers = {
\   '*':    ['trim_whitespace', 'remove_trailing_lines'],
\   'rust': ['rustfmt'],
\   'go':   ['gofmt'],
\   'c':    ['clang-format'],
\   'cpp':  ['clang-format'],
\}

let g:ale_c_clangformat_options  = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 79,
\ AllowShortFunctionsOnASingleLine: None,
\ }"'

let g:ale_virtualtext_cursor     = 'disabled'
let g:ale_fix_on_save            = 1

hi ALEErrorSign            guibg=NONE   guifg=Red
hi ALEWarningSign          guibg=NONE   guifg=Yellow
hi ALEInfoSign             guibg=NONE


" Telescope

lua << END
  require('telescope').load_extension('vim_bookmarks')
  require('telescope').load_extension('neoclip')
END

nnoremap <leader>ff   <cmd>Telescope find_files<CR>
nnoremap <leader>fg   <cmd>Telescope live_grep<CR>
nnoremap <leader>fb   <cmd>Telescope buffers<CR>
nnoremap <leader>fp   <cmd>Telescope vim_bookmarks all<CR>
nnoremap <leader>fy   <cmd>Telescope neoclip<CR>

hi TelescopeBorder guibg=NONE
hi TelescopeTitle  guibg=NONE


" Rainbow Brackets

let g:rainbow_active = 1

let g:rainbow_conf = {
\  'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
\  'guis': ['bold']
\}


" GitGutter

hi GitGutterAdd      guibg=NONE   guifg=#36e809
hi GitGutterChange   guibg=NONE   guifg=#e0da14
hi GitGutterDelete   guibg=NONE   guifg=#e80909


" Vista

let g:vista_stay_on_open = 0

nmap <leader>v :Vista<CR>


" Undotree

let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

nmap <leader>ut :UndotreeToggle<CR>


" Vim-bookmarks

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

hi BookmarkSign  guibg=NONE  guifg=DodgerBlue2

nmap <leader>b <Plug>BookmarkToggle


" Codeium

let g:codeium_enabled = v:false
let g:codeium_disable_bindings = 1

imap <script><silent><nowait><expr> <Tab> codeium#Accept()
imap <M-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <M-.>   <Cmd>call codeium#Clear()<CR>
