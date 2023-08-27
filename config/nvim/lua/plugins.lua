return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("folke/tokyonight.nvim")

	-- File browser

	use("nvim-tree/nvim-tree.lua")

	use("nvim-tree/nvim-web-devicons")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope.nvim" })
	use("nvim-lua/plenary.nvim")
	-- startup screen
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("settings/alpha-nvim").config)
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- LSP stuff
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("williamboman/mason.nvim")

	use("jay-babu/mason-nvim-dap.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind.nvim")

	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("nvim-lualine/lualine.nvim")
	-- the buffer bar
	use("kdheepak/tabline.nvim")

	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("settings/terminal")
		end,
	})
	use({
		"voldikss/vim-browser-search",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>bs", ":BrowserSearch<CR>", { noremap = true })
		end,
	})
	-- git viewer
	use("sindrets/diffview.nvim")
	--  yuck, for eww
	use("elkowar/yuck.vim")
	-- css color
	use("norcalli/nvim-colorizer.lua")

	use({
		"gelguy/wilder.nvim",
		config = function()
			require("settings/wilder")
		end,
	})
	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("settings/notify")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "folke/neodev.nvim" })
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"rcarriga/nvim-dap-ui",
		requires = { { "mfussenegger/nvim-dap" } },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	})

	use("mfussenegger/nvim-dap")
	use({
		"mfussenegger/nvim-dap-python",
		ft = "python",
		requires = {
			{ "mfussenegger/nvim-dap" },
			{ "rcarriga/nvim-dap-ui" },
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	})
end)
