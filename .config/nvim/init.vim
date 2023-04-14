call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'luochen1990/rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'preservim/nerdcommenter'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Exafunction/codeium.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.3.0' }

call plug#end()


set encoding=UTF-8
set fileencoding=UTF-8
set scrolloff=10
set cmdheight=1
set updatetime=100
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set colorcolumn=80
set signcolumn=auto:3
set ignorecase
set number
set relativenumber
set cursorline
set nobackup
set nowritebackup
set splitright splitbelow
set mouse=
set smarttab
set smartindent
set background=dark
set termguicolors
set t_Co=256

set statusline+=\ %t
set statusline+=\ %3{codeium#GetStatusString()}
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c


" Highlights

hi LineNr          guifg=white
hi CursorLine                     guibg=NONE
hi CursorLineNr    guifg=orange   guibg=NONE
hi Visual          guifg=NONE     guibg=grey30  gui=NONE
hi ColorColumn     guibg=grey62

hi clear SignColumn

hi Normal         guibg=NONE   guibg=NONE
hi EndOfBuffer    guibg=NONE   guibg=NONE
hi clear StatusLine

hi Pmenu          ctermbg=NONE  ctermfg=NONE  guibg=NONE    guifg=grey100
hi PmenuSel       ctermbg=NONE  ctermfg=NONE  guibg=grey19  guifg=grey0
hi PmenuSbar      ctermbg=NONE  ctermfg=NONE  guibg=NONE    guifg=grey0
hi PmenuThumb     ctermbg=NONE  ctermfg=NONE  guibg=grey19  guifg=grey0


" Italics

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


" Parentheses

let g:loaded_matchparen=1

" ============================================================================

let mapleader = "\<Space>"


" Bufferline

lua << END
  require("bufferline").setup{}
END


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
    filetype_exclude = { "vim", "html", "css" },
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


" COC

let g:coc_global_extensions = [
\  'coc-explorer',
\  'coc-prettier',
\  'coc-rust-analyzer',
\  'coc-clangd'
\]

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-a> :CocCommand explorer<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> cd :CocDiagnostics<CR>

nnoremap <silent> ac <Plug>(coc-codeaction-cursor)
nnoremap <silent> fj <Plug>(coc-float-jump)
nnoremap <silent> gd <Plug>(coc-definition)
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
END

nnoremap <leader>ff   <cmd>Telescope find_files<CR>
nnoremap <leader>fg   <cmd>Telescope live_grep<CR>
nnoremap <leader>fb   <cmd>Telescope buffers<CR>
nnoremap <leader>fp   <cmd>Telescope vim_bookmarks all<cr>

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


" Tagbar

let g:tagbar_width = 30
let g:tagbar_autofocus = 0
let g:tagbar_indent = 2
let g:tagbar_sort = 0
let g:tagbar_position = 'botright vertical'
let g:tagbar_compact = 1
let g:tagbar_show_data_type = 1
let g:tagbar_show_visibility = 1
let g:tagbar_foldlevel = 99

hi TagbarHighlight  guibg=grey30

nmap <silent>tb :TagbarToggle<CR>


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


" Remaps

map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

nmap op o<Esc>k
nmap oi O<Esc>j
nmap oo A<CR>
nmap tt :bp<bar>sp<bar>bn<bar>bd<CR>
nmap ty :bn<CR>
nmap tr :bp<CR>
nmap td :bd<CR>
nmap th :split<CR>
nmap tv :vsplit<CR>

nmap te :tabe<CR>
nmap tc :tabclose<CR>
nmap tn :tabnext<CR>

tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j

nnoremap <C-q>            :exit<CR>
nnoremap <S-Right>        :vertical resize -2<CR>
nnoremap <S-Left>         :vertical resize +2<CR>
nnoremap <S-Up>           :resize -2<CR>
nnoremap <S-Down>         :resize +2<CR>

nnoremap fd _
nnoremap fg $
vnoremap fd _
vnoremap fg $

nnoremap <leader>a ggVG

nnoremap <F1> :on<CR>
nnoremap <F2> :%bd<bar>e#<bar>bd#<CR>
nnoremap <F3> :/
nnoremap <F4> :noh<CR>
nnoremap <F9> :PlugUpdate <bar> CocUpdate<CR>


" Terminals

nnoremap <leader>tv :vsplit<bar>terminal<CR>
nnoremap <leader>th :split<bar>terminal<CR>

autocmd TermOpen * setlocal nonu nornu scl=no
