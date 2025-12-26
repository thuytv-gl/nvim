-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_user_command("Cd", ":cd %:p:h", {})

vim.api.nvim_create_user_command("E", function(opts)
  local command = opts.args
  if command == "" then
    print("No command provided")
    return
  end
  vim.cmd("split [t-scratch]")
  vim.cmd("%d")
  vim.cmd("r !" .. command)
  vim.cmd([[
    setlocal noswapfile 
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal nobuflisted
  ]])
end, {
  nargs = "*",
  desc = "Scratch terminal",
})

vim.api.nvim_create_user_command("Cd", ":cd %:p:h", {})
