local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})

return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}

    use {'nvim-lua/plenary.nvim'}

    use {'tjdevries/express_line.nvim'}

    use {'nvim-telescope/telescope.nvim', tag = '0.1.x'}

    -- rust
    use {'simrat39/rust-tools.nvim'}

    -- themes
    use({'rose-pine/neovim', as='rose-pine'})
    use {'ellisonleao/gruvbox.nvim'}

    -- LSP Support
    use {'neovim/nvim-lspconfig'}

    -- Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}

    use({
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
    })
    use {'saadparwaiz1/cmp_luasnip'}

    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}

    use 'mbbill/undotree'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'tpope/vim-fugitive'
    use 'windwp/nvim-autopairs'
    use 'ntpeters/vim-better-whitespace'
    use 'easymotion/vim-easymotion'
end)
