require("telescope").setup({
    defaults = {
        --
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        --
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ vim.fn.input("Grep > ") })
end)

