-- TODO: Add text case convertaion mappings.

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
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
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'plugins.nvim-tmux-navigation',
  require 'plugins.vim-test',
  require 'plugins.telescope',
  require 'plugins.oil',
  require 'plugins.gitsings',

  require 'plugins.lspconfig',
  require 'plugins.conform',

  require 'plugins.cmp',
  require 'plugins.theme',
  require 'plugins.treesitter',
  require 'plugins.mini',
  require 'plugins.render-markdown',

  require 'plugins.autopairs',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
