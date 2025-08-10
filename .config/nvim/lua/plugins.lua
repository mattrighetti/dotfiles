local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core dependencies
    "nvim-lua/plenary.nvim",       -- Lua utilities
    "tjdevries/express_line.nvim", -- Status line
    "nvim-telescope/telescope.nvim", -- Fuzzy finder

    -- Language Support
    "simrat39/rust-tools.nvim", -- Rust support
    "prettier/vim-prettier",  -- Code formatting

    -- Theme Collection
    { "rose-pine/neovim", as = 'rose-pine' }, -- Rose Pine theme
    "ellisonleao/gruvbox.nvim",         -- Gruvbox theme
    "rebelot/kanagawa.nvim",            -- Kanagawa theme
    "loctvl842/monokai-pro.nvim",       -- Monokai Pro theme

    -- LSP and Completion
    "neovim/nvim-lspconfig",  -- LSP configuration
    "hrsh7th/nvim-cmp",       -- Completion engine
    "hrsh7th/cmp-buffer",     -- Buffer completion
    "hrsh7th/cmp-path",       -- Path completion
    "hrsh7th/cmp-nvim-lsp",   -- LSP completion
    "hrsh7th/cmp-nvim-lua",   -- Lua completion
    "L3MON4D3/LuaSnip",       -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completion

    -- LSP Tools
    "williamboman/mason.nvim",         -- Package manager for LSP
    "williamboman/mason-lspconfig.nvim", -- Mason integration with LSP

    -- Version Control and History
    "mbbill/undotree",  -- Undo history visualization
    "tpope/vim-fugitive", -- Git integration

    -- Syntax and Text
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    "windwp/nvim-autopairs",         -- Auto-pair brackets
    "ntpeters/vim-better-whitespace", -- Whitespace management

    -- Navigation and Movement
    "easymotion/vim-easymotion", -- Enhanced motion
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Git
    "lewis6991/gitsigns.nvim"
})
