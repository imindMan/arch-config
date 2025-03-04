-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<localleader>fb", "<cmd>NvimTreeToggle<CR>", { noremap = true })
-- vim.keymap.del("n", "<leader>l")
-- vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { noremap = true, desc = "Lazy" })
-- vim.keymap.set("n", "<leader>le", "<cmd>LazyExtras<CR>", { noremap = true, desc = "LazyExtras" })
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>lua Snacks.zen()<CR>", { noremap = true, silent = true, desc = "Zen" })
