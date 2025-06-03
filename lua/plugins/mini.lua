return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- Disable statusline in neovim-tree buffer
    local f = function(args)
      vim.b[args.buf].ministatusline_disable = true
    end
    vim.api.nvim_create_autocmd('Filetype', { pattern = 'NvimTree', callback = f })

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      local current_line = vim.fn.line '.'
      local total_lines = vim.fn.line '$'
      local scroll_percent = math.floor((current_line / total_lines) * 100)
      return '%2l:%-2v' .. string.format(' %d', scroll_percent) .. '%%'
    end
  end,
}
