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


vim.api.nvim_create_autocmd("WinLeave", {
  desc = "Hide number column when leaving",
  group = vim.api.nvim_create_augroup("kickstart-numbar-hide-on-leave", { clear = true }),
  callback = function()
    vim.cmd("setlocal nu!")
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  desc = "Hide number column when leaving",
  group = vim.api.nvim_create_augroup("kickstart-numbar-show-on-enter", { clear = true }),
  callback = function()
    vim.cmd("setlocal nu")
  end,
})

vim.api.nvim_create_user_command("Cd", ":cd %:p:h", {})
