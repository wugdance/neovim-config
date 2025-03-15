return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'AlexvZyl/nordic.nvim',
  -- 'slugbyte/lackluster.nvim',
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  init = function()
    -- Load the colorscheme here.
    vim.o.background = 'dark'
    -- vim.cmd.colorscheme 'nordic'
    vim.cmd.colorscheme 'rose-pine'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
