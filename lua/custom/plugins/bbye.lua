return {
  "moll/vim-bbye",
  config = function()
    vim.keymap.set("n", "<leader>c", ":Bdelete!<CR>")
  end
}
