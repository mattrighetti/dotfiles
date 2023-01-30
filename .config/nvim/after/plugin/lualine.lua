require('lualine').setup({
    options = {
        section_separators = '', component_separators = '|',
    },
    sections = {
        -- left
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },

        -- right
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = { 'quickfix', 'fugitive', 'fzf' },
})
