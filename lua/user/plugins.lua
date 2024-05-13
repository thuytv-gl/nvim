local fn = vim.fn

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- vim: ts=2 sts=2 sw=2 et

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "moll/vim-bbye",
    "nvim-lualine/lualine.nvim",
    "lewis6991/impatient.nvim",
    "goolord/alpha-nvim",
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "Mofiqul/vscode.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "lewis6991/gitsigns.nvim",
    "jremmen/vim-ripgrep",
    "treesitter-context",
    -- {
    --     "ThePrimeagen/harpoon",
    --     branch = "harpoon2",
    --     dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    -- },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true
    },
}, {})
