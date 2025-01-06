-- save and restore current session
vim.keymap.set("n", "<C-s><C-s>", "<cmd>mks! ~/.vim_runtime/session.nvim<CR>")
vim.keymap.set("n", "<C-s><C-l>", "<cmd>source ~/.vim_runtime/session.nvim<CR>", { silent = true })

-- Function to search and change directory with a root directory argument
local function search_and_cd(root_dir)
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values

  pickers.new({}, {
    prompt_title = "Search and CD",
    finder = finders.new_oneshot_job({'fd', '-td', '-d2', '', '--base-directory', root_dir}, {}),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local dir = root_dir .. '/'.. selection[1]
        vim.cmd('cd ' .. dir)
        print('Changed directory to ' .. dir)
      end)
      return true
    end,
  }):find()
end

vim.keymap.set("n", "<M-S>", function() search_and_cd("c:/surecomp") end, { silent = true })
