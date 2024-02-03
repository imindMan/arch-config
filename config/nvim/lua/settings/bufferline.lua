require("bufferline").setup({
	options = {
		indicator = { style = "underline" },
		hover = {
			enable = true,
			delay = 200,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		separator_style = "slant",
	},
})
