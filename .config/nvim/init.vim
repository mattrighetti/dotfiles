set exrc
set guicursor=
set relativenumber
set nu
set hidden
set tabstop=4
set softtabstop=4
set undodir=~/.vim/undodir
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set termguicolors
set scrolloff=10
set showmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c
set nohlsearch

filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()


colorscheme gruvbox
highlight Normal guibg=none
highlight Search guibg=peru guifg=wheat

" MAPPINGS
let mapleader = ' '
nnoremap <leader>ps <cmd>Telescope find_files<cr>

lua require('mattrighetti')
