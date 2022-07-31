local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

telescope.setup {
    defaults = {
        prompt_prefix = ">  ",
        selection_caret = ">  ",
        entry_prefix = "  ",
        multi_icon = "<>",

        winblend = 5,

        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        color_devicons = true,

        layout_strategy = "horizontal",
        layout_config = {
            width = 0.95,
            height = 0.85,
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.4)
                    end
                end,
            },

            vertical = {
                width = 0.9,
                height = 0.95,
                preview_height = 0.5,
            },

            flex = {
                horizontal = {
                    preview_width = 0.9,
                },
            },
        },

        -- file_sorter = require("telescope.sorters").get_fuzzy_file,
        -- file_ignore_patterns = { "node_modules", ".git/", "dist/" },
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        -- path_display = { "absolute" },

        -- set_env = { ["COLORTERM"] = "truecolor" },
        -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
            },
            n = {
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    picker = {
        find_files = {
            theme = "dropdown",
        },
    },
}

telescope.load_extension("fzf")
