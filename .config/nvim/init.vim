" Plugins

  call plug#begin()

  Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'dense-analysis/ale'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'luochen1990/rainbow'
  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'rhysd/git-messenger.vim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'preservim/nerdcommenter'
  Plug 'akinsho/toggleterm.nvim', { 'tag': 'v2.*' }
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'junegunn/vim-emoji'
  Plug 'sindrets/diffview.nvim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'tom-anders/telescope-vim-bookmarks.nvim'
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreviewToggle' }

  call plug#end()


" Sets

  " Using Powershell shell in windows

  set shell=powershell
  set shellcmdflag=-command
  set shellquote=\"
  set shellxquote=

  set encoding=utf-8
  set scrolloff=8
  set cmdheight=1
  set updatetime=100

  set clipboard=unnamedplus
  set number
  set relativenumber
  set cursorline
  set hidden
  set incsearch
  set ignorecase
  set smartcase
  set nobackup
  set nowritebackup
  set splitright splitbelow
  set autoread
  set mouse=

  set smarttab
  set smartindent
  set colorcolumn=100

  set background=dark
  set termguicolors
  set t_Co=256

  set fillchars+=diff:╱
  set fillchars+=eob:.

  filetype plugin indent on
  syntax on


" Colorscheme

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


" Git highlight

  hi DiffAdd      gui=none    guifg=NONE       guibg=#1C4428
  hi DiffChange   gui=none    guifg=NONE       guibg=NONE
  hi DiffDelete   gui=bold    guifg=NONE       guibg=#542426
  hi DiffText     gui=none    guifg=NONE       guibg=#1E4273


let mapleader = "\<Space>"


" Toggleterm

lua << END
  require("toggleterm").setup({
	  size = 20,
	  open_mapping = [[<C-z>]],
	  hide_numbers = true,
	  shade_filetypes = {},
	  shade_terminals = true,
	  shading_factor = 2,
	  start_in_insert = true,
	  direction = "float",
	  float_opts = {
		  border = "curved",
	  },
  })
END


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

  nnoremap <silent>bd  :BufferLineMoveNext<CR>
  nnoremap <silent>be  :BufferLineMovePrev<CR>
  nnoremap <silent>bp  :BufferLineTogglePin<CR>


" Treesitter

lua << END
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = false,
      disable = { "" },
      additional_vim_regex_highlighting = true,
    },
  }
END


" Indent-blankline

lua << END
  require("indent_blankline").setup {
    buftype_exclude = {"terminal", "nofile"},
    filetype_exclude = {"help", "dashboard", "neogitstatus"},
    show_current_context = true,
    use_treesitter = false,
    show_trailing_blankline_indent = false,


    context_patterns = {
      "class", "return", "function", "method", "^if",
      "^while", "^for", "^object", "^table", "block",
      "arguments", "if_statement", "else_clause", "try_statement",
      "catch_clause", "import_statement", "operation_type"
    },
  }
END


" Diffview

lua << END

  local actions = require("diffview.actions")

  require('diffview').setup{
    diff_binaries = false,
    enhanced_diff_hl = false,
    git_cmd = { "git" },
    use_icons = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
    },

    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 30,
     },
    },

    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 15,
      },
    },

      commit_log_panel = {
        win_config = {},
      },

      hooks = {

      },
    }
END

  nnoremap <leader>gd :DiffviewOpen<CR>
  nnoremap <leader>gh :DiffviewFileHistory<CR>

  highlight FoldColumn guibg=NONE


" Colorizer

lua << END
  require('colorizer').setup()
END


" Ale

  let g:ale_linters = {
  \   'python': ['flake8', 'mypy', 'bandit', 'pydocstyle', 'pyright'],
  \}

  let g:ale_fixers = {
  \   '*': ['trim_whitespace', 'remove_trailing_lines'],
  \   'python': ['black', 'isort'],
  \}


  let g:ale_fix_on_save = 1

  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⭕'

  highlight ALEErrorSign    guibg=NONE   guifg=Red
  highlight ALEWarningSign  guibg=NONE   guifg=Yellow


" COC

  let g:coc_global_extensions = [
  \   'coc-explorer',
  \   'coc-pyright',
  \   'coc-tabnine',
  \   'coc-spell-checker',
  \   'coc-lists',
  \   'coc-html',
  \   'coc-css',
  \   'coc-emmet',
  \   'coc-prettier'
  \]

" COC Commands

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> rn <Plug>(coc-rename)

  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

  nnoremap <silent> ; :call <SID>show_documentation()<CR>
  inoremap <silent><expr> <c-f> coc#refresh()

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  hi default CocInlayHint ctermfg=71

" coc-explorer

  nnoremap <C-a> :CocCommand explorer<CR>


" coc-diagnostics

  nmap <silent> cd :CocDiagnostics<CR>

  highlight QuickFixLine ctermbg=none


" coc-snippets

  nnoremap <leader>i :CocList snippets<CR>


" coc-spell-checker

  vmap <leader>sc <Plug>(coc-codeaction-selected)
  nmap <leader>sc <Plug>(coc-codeaction-selected)


" Telescope

lua << END
  require('telescope').load_extension('file_browser')
END

  nnoremap <leader>ff   <cmd>Telescope find_files<cr>
  nnoremap <leader>fg   <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh   <cmd>Telescope help_tags<cr>

  nnoremap <leader>fgc  <cmd>Telescope git_commits<cr>
  nnoremap <leader>fgb  <cmd>Telescope git_branches<cr>

  nnoremap <leader>fb   <cmd>Telescope vim_bookmarks all<cr>
  nnoremap <leader>fa   <cmd>Telescope file_browser<cr>


" Rainbow Brackets

  let g:rainbow_active = 1

  let g:rainbow_conf = {
  \  'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
  \  'guis': ['bold']
  \}


" Tagbar

  let g:tagbar_width = 30
  let g:tagbar_autofocus = 0
  let g:tagbar_indent = 2
  let g:tagbar_sort = 0

  nmap <leader>tb :TagbarToggle<CR>


" Undotree

  nmap <leader>ut :UndotreeToggle<CR>

  let g:undotree_WindowLayout = 2
  let g:undotree_SetFocusWhenToggle = 1


" Git-messenger

  nmap <leader>g <Plug>(git-messenger)

  highlight gitmessengerPopupNormal guibg=#232324

  let g:git_messenger_date_format = "%Y/%m/%d - %X"


" GitGutter

  highlight GitGutterAdd      guibg=NONE   guifg=#36e809
  highlight GitGutterChange   guibg=NONE   guifg=#e0da14
  highlight GitGutterDelete   guibg=NONE   guifg=#e80909


" Polyglot

  let g:python_highlight_space_errors = 0


" Vim-bookmarks

  nmap <Leader>b <Plug>BookmarkToggle
  nmap <Leader>ba <Plug>BookmarkAnnotate

  highlight BookmarkSign guifg=DodgerBlue2
  highlight BookmarkAnnotationSign guifg=Green


" Markdown-preview

  nnoremap <leader>p <Esc>:MarkdownPreviewToggle<cr>


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
  tnoremap <A-Right> <C-\><C-n><C-w>l


  nnoremap <C-q>            :exit<cr>
  nnoremap <S-Right>        :vertical resize -2<CR>
  nnoremap <S-Left>         :vertical resize +2<CR>
  nnoremap <S-Up>           :resize -2<CR>
  nnoremap <S-Down>         :resize +2<CR>


  nnoremap rw <C-w>r


  nnoremap fd _
  nnoremap fg $
  vnoremap fd _
  vnoremap fg $

  nnoremap <leader>a ggVG
  vnoremap ft gq

  nnoremap <F1> :on<CR>
  nnoremap <F2> :%bd<bar>e#<bar>bd#<CR>
  nnoremap <F3> :/
  nnoremap <F4> :noh<CR>
  nnoremap <F8> :terminal<CR>
  nnoremap <F7> :CocSearch
  nnoremap <F9> :PlugUpdate <bar> CocUpdate<CR>


  command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" Terminals

  nnoremap <leader>tt :split<bar>terminal<CR>
  nnoremap <leader>tp :vsplit<bar>terminal ipython<CR>


" Autocmd

  autocmd FileType python      setlocal ts=4 sw=4 sts=4 cc=79,99 tw=95 et
  autocmd FileType vim         setlocal ts=2 sw=2 sts=2 cc=100 tw=95 et
  autocmd BufWinEnter *.md     setlocal cc=100 tw=95
  autocmd BufWinEnter *.txt    setlocal cc=100 tw=95
  autocmd TermOpen *           setlocal nonumber norelativenumber


function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
