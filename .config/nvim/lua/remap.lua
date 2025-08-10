-- Helper functions for keymap creation
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { desc = desc })
end

-- nnoremap wrapper with options support
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- File Explorer
nmap('<leader>pv', vim.cmd.Ex, '[P]roject [V]iew')

-- Telescope Keymaps
nmap('<leader>ff', require('telescope.builtin').find_files, '[F]ind [F]iles')
nmap('<leader>fg', require('telescope.builtin').live_grep, '[F]ile [G]rep')
nmap('<leader>fn', function()
    require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, '[S]earch [N]eovim files')

-- Window Navigation
nmap('<C-h>', '<C-w>h', 'Move to left window')
nmap('<C-j>', '<C-w>j', 'Move to bottom window')
nmap('<C-k>', '<C-w>k', 'Move to top window')
nmap('<C-l>', '<C-w>l', 'Move to right window')

-- Window Management
nmap('<leader>h', ':split<CR>', 'Split window horizontally')
nmap('<leader>v', '<C-w>v', 'Split window vertically')
nmap('<leader>te', ':split<CR>:term<CR>i', 'Open terminal in split')

-- Scrolling and Cursor Movement
nmap('<C-d>', '<C-d>zz', 'Scroll down and center cursor')
nmap('<C-u>', '<C-u>zz', 'Scroll up and center cursor')
