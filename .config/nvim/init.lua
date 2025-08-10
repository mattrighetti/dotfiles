-- Set leader key
vim.g.mapleader = " "

-- Load plugins
require('plugins')

-- Load keymaps
require('remap')

-- Load LSP configuration
require('matt.lsp')

-- Load completion configuration
require('matt.cmp').setup()

-- Load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

-- Setup autopairs
require('nvim-autopairs').setup {}
