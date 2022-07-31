local map = vim.keymap.set
local default_options = { silent = true }

--Remap space as leader key
map({ "n", "v" }, "a", "<Nop>", { silent = true })
map("n", "<C-e>", ":Explore<CR>")

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

map("n", "ps", "<cmd>Telescope find_files<cr>", default_options)
