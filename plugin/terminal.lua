local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
    vim.cmd("startinsert")
  end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("t", "<C-t>", "<c-\\><c-n>:bdelete!<cr>")

vim.keymap.set("n", "<C-t>", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 120)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
