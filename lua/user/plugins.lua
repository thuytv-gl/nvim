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
    "wbthomason/packer.nvim" ,
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "kyazdani42/nvim-tree.lua",
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
    "sindrets/diffview.nvim",
    {
      "hedyhli/outline.nvim",
      config = function()
        require("outline").setup {
          -- Your setup opts here (leave empty to use defaults)
        }
      end,
    },
    {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },
    {'akinsho/git-conflict.nvim', version = "*", config = true},
    {
      "stevearc/oil.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("oil").setup {
          columns = { "icon" },
          keymaps = {
            ["<C-h>"] = false,
            ["<M-h>"] = "actions.select_split",
          },
          view_options = {
            show_hidden = true,
          },
          default_file_explorer  = false,
        }

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Open parent directory in floating window
        vim.keymap.set("n", "<space>-", require("oil").toggle_float)
      end,
    },
  }, {})
