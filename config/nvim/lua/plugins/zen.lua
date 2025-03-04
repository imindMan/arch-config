return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      ---@type table<string, snacks.win.Config>
      styles = {
        -- your styles configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        --
        zen = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 140,
          height = 0,
          backdrop = { transparent = true, blend = 40 },
          keys = { q = false },
          zindex = 40,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
          w = {
            snacks_main = true,
          },
        },
      },
    },
  },
}
