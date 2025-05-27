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

    local format = function()
      conform.format()
    end

    vim.keymap.set("n", "<M-f>", format, { silent = true })
    vim.keymap.set({ "v", "n" }, "<leader><leader>f", format, { silent = true })
  end,
}

return M
