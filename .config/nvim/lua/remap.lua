local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { desc = desc })
end

-- nnoremap wrapper
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tlb_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Keymaps
nmap('<leader>pv', vim.cmd.Ex)
nmap('<leader>fn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, '[S]earch [N]eovim files')

-- Telescope
nmap('<leader>ff', require('telescope.builtin').find_files, '[F]ind [F]iles')
nmap('<leader>fg', require('telescope.builtin').live_grep,  '[F]ile [G]rep')

-- Window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Window split
nmap('<leader>h', ':split<CR>')
nmap('<leader>v', '<C-w>v')

-- Center cursor when moving up and down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
