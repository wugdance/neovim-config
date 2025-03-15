local tools = require 'tools'

ROOT = tools.define_wugdbox_path()
INBOX = ROOT .. '00-inbox/'
TEMPLATES = ROOT .. '99-meta/templates/'
INBOX_NOTE = TEMPLATES .. 'inbox_note.md'

local function gen_title()
  return os.date '%Y%m%d%H%M'
end

local function replace_placeholders(title, content)
  content = string.gsub(content, '{{date}}', os.date '%Y-%m-%d')
  content = string.gsub(content, '{{title}}', title)
  return content
end

local function create_file(filename, text)
  local file = io.open(filename, 'w')

  if file then
    file:write(text)
    file:close()
  else
    print('Error creating file: ' .. filename)
  end
end

local function get_template_content()
  local file = io.open(INBOX_NOTE, 'r')
  local content = ''

  if file then
    content = file:read 'a'
  else
    print('Error opening ' .. INBOX_NOTE .. ' template.')
  end

  return content
end

-- [c]reate [u]nique [n]ote
local function cun()
  local title = gen_title()
  local filename = INBOX .. title .. '.md'
  local content = get_template_content()
  content = replace_placeholders(title, content)
  create_file(filename, content)
  vim.cmd('edit ' .. filename)
end

vim.keymap.set('n', '<leader>wu', cun, { desc = '[U]nique note creation', silent = true })
