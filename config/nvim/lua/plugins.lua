return require("lazy").setup({
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ "folke/tokyonight.nvim" },
	-- File browser

	{ "nvim-tree/nvim-tree.lua" },

	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },
	-- startup screen
	{
		{
			"goolord/alpha-nvim",
			config = function()
				require("alpha").setup(require("settings/alpha-nvim").config)
			end,
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
	},
	-- LSP stuff
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	{ "williamboman/mason.nvim" },

	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "glepnir/lspsaga.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "stevearc/conform.nvim" },
	{ "MunifTanjim/nui.nvim" },
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("settings/terminal")
		end,
	},

	{
		"voldikss/vim-browser-search",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>bs", ":BrowserSearch<CR>", { noremap = true })
		end,
	},

	-- git viewer
	{ "sindrets/diffview.nvim" },
	--  yuck, for eww
	{ "elkowar/yuck.vim" },
	-- css color
	{ "norcalli/nvim-colorizer.lua" },

	-- Lua

	{
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
	},

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("notify").setup({
	-- 			stages = "fade",
	-- 		})
	-- 	end,
	-- },

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- nvim v0.7.2

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},

	{ "folke/neodev.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "tpope/vim-commentary" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	-- debugger stuff
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"folke/trouble.nvim",
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			popup = {
				border = "rounded",
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
