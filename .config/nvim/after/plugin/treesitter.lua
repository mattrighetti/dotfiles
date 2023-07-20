require('nvim-treesitter.configs').setup {
    ensure_installed = { "help", "typescript", "javascript", "go", "lua", "rust", "python" },

    sync_install = false,
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        }
    }
}
