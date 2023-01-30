require('plugins')
require('remap')

vim.g.mapleader = " "

-- load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('options')
require('nvimcmp')
require('nvim-autopairs').setup {}
