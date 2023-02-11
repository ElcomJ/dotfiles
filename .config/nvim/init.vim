call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'luochen1990/rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'preservim/nerdcommenter'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

call plug#end()


set encoding=UTF-8
set fileencoding=UTF-8
set scrolloff=10
set cmdheight=1
set updatetime=100
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
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
hi Visual          guifg=none     guibg=grey30  gui=none
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


" COC

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-a> :CocCommand explorer<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" Telescope

nnoremap <leader>ff   <cmd>Telescope find_files<cr>
nnoremap <leader>fg   <cmd>Telescope live_grep<cr>

hi TelescopeBorder guibg=none
hi TelescopeTitle  guibg=none


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

nnoremap <C-q>            :exit<cr>
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
