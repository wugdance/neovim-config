-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

vim.opt.colorcolumn = '79'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.laststatus = 2 -- Always show the status line

-- Set the status line in one go
-- %f -> file name
-- %m -> mode
-- %r -> readonly flag
-- %l:%L -> line number:total lines
-- %p%% -> percentage of the file
vim.opt.statusline = '%f %m %r%=%l:%L %p%%'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 400

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.langmap = table.concat({
  -- Cyrillic → Latin letters
  'йq',
  'цw',
  'уe',
  'кr',
  'еt',
  'нy',
  'гu',
  'шi',
  'щo',
  'зp',
  'фa',
  'ыs',
  'вd',
  'аf',
  'пg',
  'рh',
  'оj',
  'лk',
  'дl',
  'яz',
  'чx',
  'сc',
  'мv',
  'иb',
  'тn',
  'ьm',
  'ЙQ',
  'ЦW',
  'УE',
  'КR',
  'ЕT',
  'НY',
  'ГU',
  'ШI',
  'ЩO',
  'ЗP',
  'ФA',
  'ЫS',
  'ВD',
  'АF',
  'ПG',
  'РH',
  'ОJ',
  'ЛK',
  'ДL',
  'ЯZ',
  'ЧX',
  'СC',
  'МV',
  'ИB',
  'ТN',
  'ЬM',

  -- Special symbols mappings
  'ж\\;',
  'э\\:',
  'б\\,',
  'ю\\.',
}, ',')
