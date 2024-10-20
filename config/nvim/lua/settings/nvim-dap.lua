local dap = require("dap")

-- adapters
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",

	executable = {
		command = "/home/dev-vons/.local/share/nvim/mason/bin/codelldb",
		args = { "--port", "${port}", "--settings", '{"showDisassembly:" "never"}' },
	},
}
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.configurations.c = dap.configurations.rust
