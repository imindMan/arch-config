require("mason").setup()

require("mason-lspconfig").setup({
	-- list of servers for mason to install
	ensure_installed = {
		"lua_ls",
		"clangd",
		"pyright",
		"rust_analyzer",
	},
})
