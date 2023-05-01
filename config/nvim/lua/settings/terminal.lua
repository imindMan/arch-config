require("toggleterm").setup {
	shade_terminals = false,
	float_opts = {
    	border = 'rounded',
 	},
	highlights = {
    	FloatBorder = {
     		guifg = "#81a1c1",
    	},
  },
}

-- key bindings
vim.api.nvim_set_keymap(
  "n",
  "<leader>te",
  ":ToggleTerm direction=float",
  { noremap = true }
)
