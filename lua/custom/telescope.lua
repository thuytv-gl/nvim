local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    layout_strategy = 'vertical',

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ['dd'] = actions.delete_buffer,
        ['qq'] = actions.close
      }
    },
    layout_config = {
      preview_height = 0.7,
      vertical = {
        prompt_position = "bottom",
        mirror = true,
        height = 0.9,
        preview_cutoff = 40,
        width = 0.9
      },
    },
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "fd")

local opts = { silent = true }
local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>f", builtin.find_files, opts)
vim.keymap.set("n", "<leader>ss", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
vim.keymap.set("n", "<leader>st", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<space>ft", builtin.git_files)
vim.keymap.set("n", "<leader>sd", ":Telescope live_grep search_dirs=")
vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>")
