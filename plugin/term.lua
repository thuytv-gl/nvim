vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('t', '<C-t>', '<c-\\><c-n>:bdelete!<cr>')

local state = {
  is_open = false,
  win = nil,
  buf = nil,
}

local function close_term()
  vim.api.nvim_win_close(state.win, true)
  vim.api.nvim_buf_delete(state.buf, { force = true, unload = true })
end

local function open_term()
  local width = vim.o.columns * 0.8 -- 80% of screen width
  local height = vim.o.lines * 0.8 -- 80% of screen height
  local col = (vim.o.columns - width) / 2
  local row = (vim.o.lines - height) / 2

  state.buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer

  local opts = {
    relative = "editor",
    width = math.floor(width),
    height = math.floor(height),
    col = math.floor(col),
    row = math.floor(row),
    border = "rounded", -- or "rounded", "double", "none"
    style = "minimal",
  }

  state.win = vim.api.nvim_open_win(state.buf, true, opts)
  vim.api.nvim_set_current_win(state.win) -- Focus the new window
  vim.cmd.term()
  vim.cmd("startinsert")
end

local function toggle_float_term()
  if state.is_open then
    close_term()
  else
    open_term()
  end
  state.is_open = not state.is_open
end

vim.keymap.set({ 'n', 't' }, '<C-t>', toggle_float_term)
vim.api.nvim_create_user_command("Floaterm", toggle_float_term, {})

