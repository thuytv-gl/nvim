return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      default_file_explorer = false,
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
      win_options = {
        winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
      },
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>e', function()
      local current_buff = vim.api.nvim_get_current_buf()
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = current_buff })

      if tostring(filetype) == 'oil' then
        vim.cmd 'silent! b#'
      else
        vim.cmd 'Oil'
      end
    end, { silent = true })
  end,
}
