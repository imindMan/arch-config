require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	lua = { "luacheck" },
	python = { "pylint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})

vim.keymap.set("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { { "prettierd", "prettier" } },
		rust = { "rustfmt" },
		python = { "pyright" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
