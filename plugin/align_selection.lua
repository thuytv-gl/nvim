local M = {}

--- @param lines string[]
--- @param char string
local function get_max_char_pos(lines, char)
  local max_pos = 0
  for _, line in ipairs(lines) do
    local pos = line:find(char, 1, true) -- plain search for speed
    if pos and pos > max_pos then
      max_pos = pos
    end
  end
  return max_pos
end

--- @param lines string[]
--- @param char string
local function align_lines(lines, char)
  local target_pos = get_max_char_pos(lines, char)
  if target_pos == 0 then
    return lines
  end

  local formatted = {}
  for i, line in ipairs(lines) do
    local pos = line:find(char, 1, true)
    if pos and pos < target_pos then
      local before = line:sub(1, pos - 1)
      local after = line:sub(pos)
      formatted[i] = before .. string.rep(" ", target_pos - pos) .. after
    else
      formatted[i] = line
    end
  end
  return formatted
end

--- @param char string
function M.align_selection_by_char(char)
  char = char or "="

  -- Get range and normalize for upwards selection
  local start_lnum = vim.fn.line("v")
  local end_lnum = vim.fn.line(".")
  local start_row = math.min(start_lnum, end_lnum) - 1
  local end_row = math.max(start_lnum, end_lnum)

  -- Get, Process, and Set
  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)
  local processed_lines = align_lines(lines, char)

  vim.api.nvim_buf_set_lines(0, start_row, end_row, false, processed_lines)
end

-- Keymap
vim.keymap.set("v", "-", function()
  M.align_selection_by_char("=")
end, { desc = "Align selection by '-'" })

return M
