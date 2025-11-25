-- Command-line abbrevation
vim.cmd [[cnoreabbrev oil Oil]]

vim.api.nvim_create_user_command('FormatMdTable', function()
  -- Get the visual selection range
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  -- Get the lines
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Split each line into columns
  local columns = {}
  local column_widths = {}
  for i, line in ipairs(lines) do
    -- Skip empty lines
    if line:match '^%s*$' then
      goto continue
    end

    -- Split the line into cells
    local cells = {}
    for cell in line:gmatch '([^|]+)' do
      cell = cell:match '^%s*(.-)%s*$' -- Trim whitespace
      table.insert(cells, cell)
    end

    -- Remove empty cells at the beginning and end
    if #cells > 0 and cells[1] == '' then
      table.remove(cells, 1)
    end
    if #cells > 0 and cells[#cells] == '' then
      table.remove(cells, #cells)
    end

    -- Store the cells and calculate max widths
    table.insert(columns, cells)
    for j, cell in ipairs(cells) do
      column_widths[j] = math.max(column_widths[j] or 0, vim.fn.strdisplaywidth(cell))
    end

    ::continue::
  end

  -- Format each line with proper padding
  local formatted_lines = {}
  for i, cells in ipairs(columns) do
    local formatted_cells = {}
    for j, cell in ipairs(cells) do
      -- For separator lines, use the appropriate number of dashes
      if cell:match '^%-*$' then
        formatted_cells[j] = string.rep('-', column_widths[j])
      else
        -- Left-align the cell content
        formatted_cells[j] = cell .. string.rep(' ', column_widths[j] - vim.fn.strdisplaywidth(cell))
      end
    end

    -- Join cells with " | " separators
    local formatted_line = '| ' .. table.concat(formatted_cells, ' | ') .. ' |'
    table.insert(formatted_lines, formatted_line)
  end

  -- Replace the original lines with the formatted ones
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, formatted_lines)
end, { range = true })
