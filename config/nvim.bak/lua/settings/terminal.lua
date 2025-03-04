require("toggleterm").setup({
	hide_numbers = false,
	shade_terminals = false,
	direction = "float",
	float_opts = {
		border = "rounded",
		title_pos = "center",
	},
	highlights = {
		FloatBorder = {
			guifg = "#81a1c1",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
