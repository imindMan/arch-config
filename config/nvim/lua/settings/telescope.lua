-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
	defaults = {
		
		color_devicons = true,	
	},
	extensions = {
    	file_browser = {
      		theme = "ivy",
      			-- disables netrw and use telescope-file-browser in its place
      		hijack_netrw = true,
    	},
  	},
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- settings keymaps

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<space>ff",
  ":Telescope find_files",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<space>of",
  ":Telescope oldfiles",
  { noremap = true }
)
