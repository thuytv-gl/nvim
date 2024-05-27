local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

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
  },
}

-- Telescope
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>ss", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
vim.keymap.set("n", "<leader>st", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>", opts)
