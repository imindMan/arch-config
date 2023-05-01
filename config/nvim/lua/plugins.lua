 -- All the needed plugins anyway :)

 return {
	 
	 {
		 'folke/tokyonight.nvim',	
	 },
 
	 -- File browser 
	 {
  		"nvim-tree/nvim-tree.lua",
  		
  		dependencies = {
    		"nvim-tree/nvim-web-devicons",
  		},
	},
	{
    	"nvim-telescope/telescope-file-browser.nvim",
   		 dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	 },

	 -- Status bar
	 {'nvim-lualine/lualine.nvim'},
	 {
		 'neovim/nvim-lspconfig',
		 'hrsh7th/cmp-nvim-lsp',
		 'hrsh7th/cmp-buffer',
		 'hrsh7th/cmp-path',
		 'hrsh7th/cmp-cmdline',
		 'hrsh7th/nvim-cmp',
		 'L3MON4D3/LuaSnip',
		 'saadparwaiz1/cmp_luasnip',
	 },
	 -- startup screen
	 {
		 "startup-nvim/startup.nvim",
  		 dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  		 config = function()
    		 require"startup".setup(require"settings/startup-nvim")
  		 end
	 },
	 -- treesitter
	 {
		 "nvim-treesitter/nvim-treesitter",
		 config = function()
			 vim.api.nvim_command("TSUpdate")
			 require("settings/treesitter")
		 end
	 },
	 -- LSP stuff 
	 {
  		 'VonHeikemen/lsp-zero.nvim',
 		  branch = 'v1.x',
  		  dependencies = {
     -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional
      
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional
  
          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
  		 }
	 },
	 -- the buffer bar 
	 {
		 'kdheepak/tabline.nvim',
  		 config = function()
    		 require("settings/tabline")
  		 end,
	 },
		 -- terminal 
	 {
 	 	 -- amongst your other plugins 
		 'akinsho/toggleterm.nvim',
		 config = function()
			 require("settings/terminal")
		 end,
	 },
	 {
		 'voldikss/vim-browser-search',
		 config = function()
			 vim.api.nvim_set_keymap(
            "n",
            "<leader>bs",
            ":BrowserSearch",
  			 { noremap = true }
			 )
		 end,
	 },
	 -- git viewer
	 {'sindrets/diffview.nvim'},
	 --  yuck, for eww 
	 {'elkowar/yuck.vim'},
	 -- css color 
	 {
		 'norcalli/nvim-colorizer.lua',
 
 	 }
 }
