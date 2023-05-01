-- First general setup
vim.g.mapleader = '\\'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.ignorecase = true
vim.api.nvim_command("set nobackup")
vim.api.nvim_command("set nowb")
vim.api.nvim_command("set noswapfile")
-- Initialize the lazy.nvim itself
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

-- Start setting up some "plugins" 
function lazy.setup(plugins)
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup("plugins")

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight-night')

-- Call all the settings from the lua/ directory
require("settings/nvimtree")
require("settings/telescope")
require('settings/lualine')
require("settings/cmp")
require("settings/lsp")


