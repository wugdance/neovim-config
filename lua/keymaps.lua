-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- copy the relative path of the current buffer to the system clipboard
-- TODO: Copy current buffer name without path.
vim.keymap.set('n', '<leader>bc', ":let @+ = './' . expand('%:p:.')<CR>", { desc = '[C]opy relative path for current buffer', noremap = true, silent = true })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local function move_current_file()
  local current_file = vim.fn.expand '%:p'
  local new_file = vim.fn.input('Move to: ', current_file, 'file')
  if new_file ~= '' and new_file ~= current_file then
    vim.cmd('saveas ' .. new_file)
    vim.cmd('silent !rm ' .. current_file)
    vim.cmd('e ' .. new_file)
  end
end

vim.keymap.set('n', '<leader>mv', move_current_file, { noremap = true, silent = true })
