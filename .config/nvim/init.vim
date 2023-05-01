call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'luochen1990/rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'preservim/nerdcommenter'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Exafunction/codeium.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.3.0' }
Plug 'AckslD/nvim-neoclip.lua'

call plug#end()

source ~/.config/nvim/config/keybinds.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/configs.vim
