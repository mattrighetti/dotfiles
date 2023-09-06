vim.g.mapleader = " "

require('plugins')
require('remap')
require('matt')

-- load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('nvim-autopairs').setup {}
