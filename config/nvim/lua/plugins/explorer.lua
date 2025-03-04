-- lazy.nvim
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            sort = { fields = { "sort" } },
            supports_live = true,
            tree = true,
            watch = true,
            diagnostics = true,
            diagnostics_open = false,
            git_status = true,
            git_status_open = false,
            git_untracked = true,
            follow_file = true,
            focus = "list",
            auto_close = true,
            layout = {
              layout = {
                backdrop = false,
                row = 1.75,
                col = 1,
                width = 0.01,
                min_width = 30,
                min_height = 80,
                height = 0.9,
                border = "none",
                box = "vertical",
                { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
                {
                  box = "vertical",
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
                position = "float",
              },
            },
            formatters = {
              file = { filename_only = true },
              severity = { pos = "right" },
            },
            matcher = { sort_empty = false, fuzzy = true },
            config = function(opts)
              return require("snacks.picker.source.explorer").setup(opts)
            end,

            jump = { close = true }, -- Close the picker after jumping to a file
          },
        },
      },
    },
  },
}
