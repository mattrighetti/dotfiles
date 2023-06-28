local builtin = require("telescope.builtin")

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  {})

-- nnoremap wrapper
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tlb_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Open project explorer
-- Center cursor when moving up and down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
