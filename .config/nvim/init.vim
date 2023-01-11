" Plugins

  call plug#begin()

  Plug 'dstein64/vim-startuptime'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-gitgutter'
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'luochen1990/rainbow'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'preservim/nerdcommenter'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

  call plug#end()


" Neovim Configs

  " Using Powershell shell in windows

  set number
  set relativenumber
  set cursorline
  set colorcolumn=79,99
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

  hi ColorColumn     guibg=grey19

  highlight clear SignColumn

  highlight Normal         guibg=NONE  ctermbg=NONE
  highlight EndOfBuffer    guibg=NONE  ctermbg=NONE


" Italics

  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"


let mapleader = "\<Space>"


" Lualine

lua << END
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'kanagawa',
    },
  }
END


" Bufferline

lua << END
  require("bufferline").setup{
    options = {
      indicator_style = " ",
      show_buffer_close_icons = false,
      tab_size = 16
    }
  }
END

  nnoremap <silent>bp  :BufferLineTogglePin<CR>


" Indent-blankline

lua << END
  require("indent_blankline").setup {}
END


" COC

  let g:coc_global_extensions = [
  \   'coc-explorer',
  \   'coc-prettier'
  \]

  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  nnoremap <C-a> :CocCommand explorer<CR>


" Telescope

  nnoremap <leader>ff   <cmd>Telescope find_files<cr>
  nnoremap <leader>fg   <cmd>Telescope live_grep<cr>


" Rainbow Brackets

  let g:rainbow_active = 1

  let g:rainbow_conf = {
  \  'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
  \  'guis': ['bold']
  \}


" Undotree

  nmap <leader>ut :UndotreeToggle<CR>

  let g:undotree_WindowLayout = 2
  let g:undotree_SetFocusWhenToggle = 1


" GitGutter

  highlight GitGutterAdd      guibg=NONE   guifg=#36e809
  highlight GitGutterChange   guibg=NONE   guifg=#e0da14
  highlight GitGutterDelete   guibg=NONE   guifg=#e80909


" Easymotion

  map \ <Plug>(easymotion-bd-jk)
  nmap \ <Plug>(easymotion-overwin-line)

  map  / <Plug>(easymotion-bd-w)
  nmap / <Plug>(easymotion-overwin-w)


" Remaps

  map <C-Left> <C-w>h
  map <C-Down> <C-w>j
  map <C-Up> <C-w>k
  map <C-Right> <C-w>l


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

  nnoremap <leader>th :vsplit<bar>terminal<CR>
  nnoremap <leader>tv :split<bar>terminal<CR>
