local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { desc = desc })
end

-- Keymaps
nmap('<leader>pv', vim.cmd.Ex)

-- Telescope
nmap('<leader>ff', require('telescope.builtin').find_files, '[F]ind [F]iles')
nmap('<leader>fg', require('telescope.builtin').live_grep,  '[F]ile [G]rep')

-- nnoremap wrapper
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tlb_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Open project explorer
-- Center cursor when moving up and down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
