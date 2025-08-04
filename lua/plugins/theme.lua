return {
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  init = function()
    require('rose-pine').setup {
      dark_variant = 'main',

      styles = {
        bold = false,
        italic = false,
      },
    }

    vim.o.background = 'dark'

    vim.cmd.colorscheme 'rose-pine'

    -- Enbale true color support
    vim.o.termguicolors = true

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
