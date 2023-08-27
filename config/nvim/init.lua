-- First general setup
vim.g.mapleader = "\\"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.api.nvim_command("set nobackup")
vim.api.nvim_command("set nowb")
vim.api.nvim_command("set noswapfile")
vim.api.nvim_command("set cursorline")
vim.cmd([[
	let g:clipboard = {
	\	'name': 'xclip',
	\	'copy': {
	\		'+': 'xclip -i -selection clipboard',
	\		'*': 'xclip -i -selection clipboard',
	\	},
	\	'paste': {
	\       '+': 'xclip -o -selection clipboard',
	\		'*': 'xclip -o -selection clipboard',
	\	},
	\ }

]])
vim.notify = require("notify")
-- Switch to packer :((((
require("plugins")
vim.opt.termguicolors = true
vim.cmd([[ colorscheme tokyonight-night]])
-- Call all the settings from the lua/ directory
require("settings/nvimtree")
require("settings/telescope")
require("settings/lualine")
require("settings/tabline")
require("settings/cmp")
require("settings/mason")
require("settings/lspsaga")
require("settings/lspconfig")
require("settings/null-ls")
require("settings/treesitter")
require("settings/nvim-dap")
