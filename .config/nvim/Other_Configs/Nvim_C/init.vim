call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'dense-analysis/ale'
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'luochen1990/rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'preservim/nerdcommenter'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

call plug#end()


set encoding=UTF-8
set fileencoding=UTF-8
set scrolloff=10
set cmdheight=1
set updatetime=100
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set colorcolumn=80,100
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

colorscheme kanagawa


" Highlights

hi CursorLine                     guibg=grey19
hi CursorLineNr    guifg=#b57504  guibg=NONE
hi Visual          guifg=NONE     guibg=grey30  gui=NONE
hi ColorColumn     guibg=grey35

hi clear SignColumn

hi Normal         guibg=NONE  ctermbg=NONE
hi EndOfBuffer    guibg=NONE  ctermbg=NONE


" Italics

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" ======================================================================

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
    filetype_exclude = { "vim" },
    show_trailing_blankline_indent = false,

    context_patterns = {
      "class", "return", "function", "method", "^if",
      "^while", "^for", "^object", "^table", "block",
      "arguments", "if_statement", "else_clause", "try_statement",
      "catch_clause", "import_statement", "operation_type"
    },
  }
END


" COC

let g:coc_global_extensions = [
\  'coc-explorer',
\  'coc-prettier',
\  'coc-clangd'
\]

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-a> :CocCommand explorer<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> cd :CocDiagnostics<CR>

nnoremap <silent> ac <Plug>(coc-codeaction-cursor)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> rn <Plug>(coc-rename)

nnoremap <silent> ; :call <SID>show_documentation()<CR>

function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   else
     call CocAction('doHover')
   endif
endfunction

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Left>"

hi QuickFixLine ctermbg=NONE

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" ALE

let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'c': ['clang-format'],
\}

let g:ale_c_clangformat_options = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 100,
\ AllowShortBlocksOnASingleLine: Always,
\ AllowShortFunctionsOnASingleLine: Inline,
\ FixNamespaceComments: true,
\ ReflowComments: false,
\ }"'

let g:ale_fix_on_save = 1
let g:ale_sign_error = '--'
let g:ale_sign_warning = '--'

hi ALEErrorSign    guibg=NONE   guifg=Red
hi ALEWarningSign  guibg=NONE   guifg=Yellow


" Telescope

nnoremap <leader>ff   <cmd>Telescope find_files<CR>
nnoremap <leader>fg   <cmd>Telescope live_grep<CR>

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
let g:tagbar_position = 'leftabove vertical'
let g:tagbar_compact = 1
let g:tagbar_show_data_type = 1
let g:tagbar_show_visibility = 1
let g:tagbar_foldlevel = 99

nmap <silent>tb :TagbarToggle<CR>


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

autocmd TermOpen * setlocal nonumber norelativenumber
