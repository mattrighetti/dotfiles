require "mattrighetti.profile"
require "mattrighetti.mappings"

vim.g.mapleader = " "

require "mattrighetti.options"
require "mattrighetti.plugins"

-- LSP
require "mattrighetti.lsp"

-- Telescopne
require "mattrighetti.telescope"

-- enable filetypee.lua
-- This feature is currently opt-in
-- as it does not yet completely match all of the filetypes covered by filetype.vim
vim.g.do_filetype_lua = 1
-- disable filetype.vim
vim.g.did_load_filetypes = 0
