require('plugins')

vim.g.mapleader = " "

-- load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('mylsp')
require('options')
require('nvimcmp')

require('lsp_signature').setup({
    hint_prefix = "",
    floating_windows = false
})

-- lualine
require('lualine').setup()

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

require('nvim-autopairs').setup {}
