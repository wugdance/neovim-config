vim.keymap.set({ 'n', 'v', 'o' }, '<Space>', '<Nop>', { silent = true })
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.keymap.set({ 'n', 'v', 'o' }, '<Space>', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Python Configutaion
vim.g.python3_host_prog = '/usr/bin/python3'

-- Node Configuration
vim.g.node_host_prog = '/usr/bin/node'

-- Diagnostic config
vim.diagnostic.config {
  virtual_text = false, -- disable inline diagnostic
  underline = false, -- disable underline
  signs = true,
}

require 'options'
require 'keymaps'
require 'wugdbox'
require 'autocmd'
require 'commands'

-- [[ Configure and install plugins ]]
require 'lazy-bootstrap'
require('lazy').setup {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'plugins.nvim-tmux-navigation',
  require 'plugins.vim-test',
  require 'plugins.telescope',
  require 'plugins.oil',
  require 'plugins.gitsings',
  require 'plugins.undotree',

  require 'plugins.lspconfig',
  require 'plugins.conform',

  require 'plugins.cmp',
  require 'plugins.theme',
  require 'plugins.treesitter',
  require 'plugins.mini',
  require 'plugins.autopairs',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
