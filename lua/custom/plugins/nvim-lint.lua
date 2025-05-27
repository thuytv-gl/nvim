return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    local phpcs = require('lint').linters.phpcs
    phpcs.args = {
      '-q',
      -- <- Add a new parameter here
      '--report=json',
      '--standard=PSR12',
      '-'
    }
    lint.linters_by_ft = {
      php = { "phpcs" },
      javascript = { "biome" },
      ruby = { "erb-lint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
