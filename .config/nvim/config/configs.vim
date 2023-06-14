source ~/.config/nvim/config/functions.vim

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
set laststatus=3
set showtabline=2
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

set tabline=%!Tabline()

set statusline+=\ %t
set statusline+=\ %3{codeium#GetStatusString()}
set statusline+=%=
set statusline+=%{GitStatus()}
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
hi StatusLine     guibg=white  guifg=grey23

hi TabLineFill    guifg=grey23
hi TabLineSel     guibg=grey10  guifg=orange
hi TabLine        guifg=white   guibg=grey23  gui=NONE

hi Pmenu          ctermbg=NONE  ctermfg=NONE  guibg=NONE    guifg=grey100
hi PmenuSel       ctermbg=NONE  ctermfg=NONE  guibg=grey19  guifg=grey0
hi PmenuSbar      ctermbg=NONE  ctermfg=NONE  guibg=NONE    guifg=grey0
hi PmenuThumb     ctermbg=NONE  ctermfg=NONE  guibg=grey19  guifg=grey0


" Italics

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


" Parentheses

let g:loaded_matchparen=1
