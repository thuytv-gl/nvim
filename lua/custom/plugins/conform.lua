local M = {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome", stop_after_first = true },
        php = { "php-cs-fixer" },
        ruby = { "erb-formatter" },
      },
    })

    vim.keymap.set("n", "<M-f>", function()
      conform.format()
    end, { silent = true })
  end,
}

return M
