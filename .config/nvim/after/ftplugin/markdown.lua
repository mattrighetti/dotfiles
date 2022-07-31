vim.api.nvim_create_autocmd({"BufNewFile","BufReadPost"}, {
        pattern = "*.md",
        command = "set filetype=markdown",
    }
)

vim.api.nvim_create_autocmd("FileType", {
    command = "markdown setlocal wrap linebreak textwidth=80",
})

