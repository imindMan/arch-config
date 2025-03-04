-- First general setup
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.g.mapleader = "\\"
vim.g.zig_fmt_autosave = 0
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.api.nvim_command("set nobackup")
vim.api.nvim_command("set nowb")
vim.api.nvim_command("set noswapfile")
vim.api.nvim_command("set cursorline")
vim.api.nvim_command("set mousemoveevent")

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("plugins")
vim.cmd([[ colorscheme tokyonight-night]])
-- Call all the settings from the lua/ directory
require("settings.nvimtree")
require("settings.telescope")
require("settings.bufferline")
require("settings.lualine")
require("settings.cmp")
require("settings.mason")
require("settings.lspsaga")
require("settings.lspconfig")
require("settings.nvim-lint")
require("settings.nvim-dap")
require("settings.treesitter")
require("mappings")
require("settings.noice")
