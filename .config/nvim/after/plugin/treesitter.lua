require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c", "lua", "rust",
        "go", "typescript", "python",
        "bash", "css", "html",
        "dockerfile", "java", "sql"
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
