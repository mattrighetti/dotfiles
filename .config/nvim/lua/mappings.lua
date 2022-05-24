local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- better indenting
map("n", "ps", "<cmd>Telescope find_files<cr>", default_options)