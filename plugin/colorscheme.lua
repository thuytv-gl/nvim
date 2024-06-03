local colorscheme = "default"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end

-- match the colors of buffer end with current color scheme
-- pcall(vim.cmd.highlight,'EndOfBuffer guibg=', colorscheme)
pcall(vim.cmd.highlight,'MatchParen', 'guibg=nil guifg=#ef4444')

