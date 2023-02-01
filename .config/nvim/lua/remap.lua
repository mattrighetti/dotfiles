-- Keymaps

-- Open project explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- nnoremap wrapper
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tlb_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Center cursor when moving up and down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
