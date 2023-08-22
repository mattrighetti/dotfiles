local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({layout_strategy='vertical',layout_config={width=0.5}})
end, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ vim.fn.input("Grep > ") })
end)

