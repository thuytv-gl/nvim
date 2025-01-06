return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.cursorword").setup();
      require("mini.comment").setup({
        mappings = {
          comment = "<M-/>",
          -- Toggle comment on current line
          comment_line = "<M-/>",

          -- Toggle comment on visual selection
          comment_visual = "<M-/>",

          -- Define "comment" textobject (like `dgc` - delete whole comment block)
          -- Works also in Visual mode if mapping differs from `comment_visual`
          textobject = "<M-/>",
        },
      })
    end,
  },
}
