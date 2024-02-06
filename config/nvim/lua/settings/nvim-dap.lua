local dap = require("dap")

-- adapters
dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",

	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}
