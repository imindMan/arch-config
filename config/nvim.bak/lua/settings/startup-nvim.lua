local settings = {
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            "██╗ ███╗   ███╗ ██╗ ███╗   ██╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            "██║ ████╗ ████║ ██║ ████╗  ██║ ██╔══██╗ ██║   ██║ ██║ ████╗ ████║",
            "██║ ██╔████╔██║ ██║ ██╔██╗ ██║ ██║  ██║ ██║   ██║ ██║ ██╔████╔██║",
            "██║ ██║╚██╔╝██║ ██║ ██║╚██╗██║ ██║  ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            "██║ ██║ ╚═╝ ██║ ██║ ██║ ╚████║ ██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            "╚═╝ ╚═╝     ╚═╝ ╚═╝ ╚═╝  ╚═══╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { " Find", "Telescope find_files", "<leader>ff" },
            { " Recent", "Telescope oldfiles", "<leader>of" },
            { " Browser", "Telescope file_browser", "<leader>fb" },
			{ " Settings", "e ~/.config/nvim", "<leader>ss" },

        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = { "Nothing special - imindMan" },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 10, 3, 3, 3},
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body", "footer" },
}
return settings
