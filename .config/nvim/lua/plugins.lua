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
  "nvim-lua/plenary.nvim",
  "tjdevries/express_line.nvim",
  "nvim-telescope/telescope.nvim",

  -- rust
  "simrat39/rust-tools.nvim",

  -- themes
  {"rose-pine/neovim", as='rose-pine'},
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",
  "loctvl842/monokai-pro.nvim",

  -- LSP Support
  "neovim/nvim-lspconfig",

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  "L3MON4D3/LuaSnip",

  "saadparwaiz1/cmp_luasnip",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "mbbill/undotree",

  "nvim-treesitter/nvim-treesitter",
  "tpope/vim-fugitive",
  "windwp/nvim-autopairs",
  "ntpeters/vim-better-whitespace",
  "easymotion/vim-easymotion"
})
