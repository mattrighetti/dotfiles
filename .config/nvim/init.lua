vim.g.mapleader = " "

require('plugins')
require('remap')

-- load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('options')
require('nvimcmp')
require('nvim-autopairs').setup {}
