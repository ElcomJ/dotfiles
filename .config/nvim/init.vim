call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'CRAG666/code_runner.nvim', {'for': 'python'}
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/vim-emoji'
Plug 'Pocco81/auto-save.nvim'

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'sindrets/diffview.nvim'
Plug 'easymotion/vim-easymotion'
" Plug 'puremourning/vimspector'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tpope/vim-surround'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'vim-test/vim-test', {'for': 'python'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'hrsh7th/nvim-compe'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }

call plug#end()

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
set splitright
set splitbelow
set autoread
set foldmethod=manual
set mouse=

set smarttab
set smartindent

syntax on
set background=dark
set termguicolors
set t_Co=256

" set signcolumn=yes:2

set fillchars+=diff:╱
set fillchars+=eob:.


filetype on
filetype plugin on
filetype indent on


let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox


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

  nnoremap <C-x> :ToggleTerm size=12 direction=horizontal<CR>


" Lualine

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
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


" Code_runner

lua << END
  require('code_runner').setup {
    mode = "term",
    startinsert = true,

    term = {
      position = "vert",
      size = 60
    },

	  filetype = {
		  python = "python -u"
	  },
  }
END

  nnoremap <leader>r :RunFile<CR>


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
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
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


" Neoclip

lua << END
  require('neoclip').setup{
    default_register = '+'
  }
END


" Colorizer

lua << END
  require('colorizer').setup()
END


" Auto-save

lua << END
  require('auto-save').setup{
    enable = true,
    trigger_events = {"InsertLeave", "TextChangedI"}
  }
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

  let g:ale_virtualtext_cursor = 0
  let g:ale_virtualtext_prefix = ' ➤ '

  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'

  highlight ALEErrorSign    guibg=NONE   guifg=Red
  highlight ALEWarningSign  guibg=NONE   guifg=Yellow

  highlight ALEVirtualTextError    guibg=grey19   guifg=Red
  highlight ALEVirtualTextWarning  guibg=grey19   guifg=Yellow

  nmap >a :ALENext<CR>
  nmap <a :ALEPrevious<CR>
  nmap ?  :ALEDetail<CR>


" COC

  let g:coc_global_extensions = [
  \   'coc-explorer',
  \   'coc-pyright',
  \   'coc-tabnine',
  \   'coc-snippets',
  \   'coc-spell-checker',
  \   'coc-cspell-dicts'
  \]

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> rn <Plug>(coc-rename)

  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <F7> :CocSearch


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
  require('telescope').load_extension('neoclip')
  require('telescope').load_extension('file_browser')
  require("telescope").load_extension("emoji")
END

  nnoremap <leader>ff  <cmd>Telescope find_files<cr>
  nnoremap <leader>fg  <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb  <cmd>Telescope buffers<cr>
  nnoremap <leader>fo  <cmd>Telescope oldfiles<cr>
  nnoremap <leader>fh  <cmd>Telescope help_tags<cr>

  nnoremap <leader>fgc <cmd>Telescope git_commits<cr>
  nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
  nnoremap <leader>fgs <cmd>Telescope git_stash<cr>

  nnoremap <leader>fbb <cmd>Telescope vim_bookmarks all<cr>
  nnoremap <leader>fy  <cmd>Telescope neoclip<cr>
  nnoremap <leader>fa  <cmd>Telescope file_browser<cr>
  nnoremap <leader>fe  <cmd>Telescope emoji<cr>


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

  nmap <F6> :TagbarToggle<CR>


" Undotree

  nmap <F5> :UndotreeToggle<CR>

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


" NERD Commenter

  " <leader> cc comment   lines
  " <leader> cu uncomment lines


" Multiple-cursors

  let g:multi_cursor_start_word_key      = '<C-n>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_quit_key            = '<Esc>'

  " Depois que selecionar as palavras, aperte a letra (c) para trocar
  " Depois que fazer os multi-cursors, aperta ESC depois C-n e (i)


" Polyglot

  let g:python_highlight_space_errors = 0


" Vim-pydocstring

  let g:pydocstring_formatter = 'numpy'
  let g:pydocstring_doq_path = 'C:\Dev\venv\Scripts\doq.exe'

  nmap <leader>d  :Pydocstring<CR>
  nmap <leader>df :PydocstringFormat<CR>


" Vim-test

  let test#strategy = "neovim"
  let test#neovim#term_position = "vert"

  nmap <leader>t  :TestFile<CR>
  nmap <leader>ts :TestSuite<CR>


" Nvim-compe

  let g:compe = {}
  let g:compe.enabled = v:true

  let g:compe.source = {}
  let g:compe.source.path = v:true


" Vim-bookmarks

  nmap <Leader>b <Plug>BookmarkToggle
  nmap <Leader>ba <Plug>BookmarkAnnotate

  highlight BookmarkSign guifg=DodgerBlue2
  highlight BookmarkAnnotationSign guifg=Green


" Markdown-preview

  nnoremap <leader>p <Esc>:MarkdownPreviewToggle<cr>


" Vim-surround

  " ysiw)     = hello   > (hello)
  " df)       = (hello) > hello
  " yswfprint = hello   > print(hello)
  " cs([      = (hello) > [hello]


" Easymotion

  nmap ] <Plug>(easymotion-overwin-f2)

  map \ <Plug>(easymotion-bd-jk)
  nmap \ <Plug>(easymotion-overwin-line)

  map  / <Plug>(easymotion-bd-w)
  nmap / <Plug>(easymotion-overwin-w)


" Vim-sendtowindow

  " <leader>l = Move to right
  " <leader>h = Move to left
  " <leader>k = Move to up
  " <leader>j = Move to down


" Vimspector

  " nnoremap <Leader>dd :call vimspector#Launch()<CR>
  " nnoremap <Leader>de :call vimspector#Reset()<CR>
  " nnoremap <Leader>dc :call vimspector#Continue()<CR>

  " nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
  " nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
  " nnoremap <Leader>dL :call vimspector#ListBreakpoints()<CR>

  " nmap <Leader>dr <Plug>VimspectorRestart
  " nmap <Leader>ds <Plug>VimspectorStop
  " nmap <Leader>dh <Plug>VimspectorStepOut
  " nmap <Leader>dl <Plug>VimspectorStepInto
  " nmap <Leader>dj <Plug>VimspectorStepOver


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


  nnoremap <S-j>            :m .+1<CR>==
  nnoremap <S-k>            :m .-2<CR>==
  inoremap <C-j> <Esc>      :m .+1<CR>==gi
  inoremap <C-k> <Esc>      :m .-2<CR>==gi
  vnoremap <S-j>            :m '>+1<CR>gv=gv
  vnoremap <S-k>            :m '<-2<CR>gv=gv


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
  nnoremap <F9> :PlugUpdate <bar> CocUpdate<CR>


  " <C-y> select the autocomplete option
  " <C-e> close the autocomplete menu


  " command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" Terminals

  nnoremap <leader>tt :vsplit<bar>terminal<CR>
  nnoremap <leader>tp :vsplit<bar>terminal ipython<CR>


" Autocmd

  autocmd FileType sql         setlocal ts=2 sw=2 sts=2 cc=100 tw=95 et
  autocmd FileType python      setlocal ts=4 sw=4 sts=4 cc=79 tw=75 et
  autocmd FileType vim         setlocal ts=2 sw=2 sts=2 cc=100 tw=95 et
  autocmd BufWinEnter *.md     setlocal cc=100 tw=95
  autocmd BufWinEnter *.txt    setlocal cc=100 tw=95
  autocmd BufWinEnter *.yml    setlocal cc=100 sw=2 ts=2 tw=95
  autocmd BufWinEnter *.yaml   setlocal cc=100 sw=2 ts=2 tw=95
  autocmd BufWinEnter *.json   setlocal cc=100 sw=2 ts=2 tw=95

  " autocmd BufWinLeave *.* mkview
  " autocmd BufWinEnter *.* silent loadview

  " How to use code folding in vim(create view archive in nvim folder):

  "   zf (folding the selected code)
  "   zo (open the fold)
  "   zO (open the fold and sub-fold)
  "   zc (close the fold)
  "   zC (close the fold and sub-fold)
  "   zd (delete the fold)


function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
