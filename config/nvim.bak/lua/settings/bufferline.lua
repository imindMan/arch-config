require("bufferline").setup({
	options = {
		mode = "buffers",
		indicator = { style = "underline" },
		hover = {
			enable = true,
			delay = 200,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		show_close_icons = true,
		show_buffer_close_icons = true,
	},
})
