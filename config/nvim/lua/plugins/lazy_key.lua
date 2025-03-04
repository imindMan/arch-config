return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration here
    },
    keys = {
      { "<leader>ll", "<cmd>Lazy<cr>", desc = "Lazy" },
      { "<leader>le", "<cmd>LazyExtras<cr>", desc = "LazyExtras" },
    },
  },
}
