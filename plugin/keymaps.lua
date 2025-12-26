-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Better paste
vim.keymap.set('v', 'p', '"_dP', { silent = true })

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })

vim.keymap.set('n', '<C-q>', function()
  vim.cmd [[
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  ]]
end, { desc = 'Move focus to the upper window' })

-- quick exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { silent = true })
vim.keymap.set('i', 'kj', '<ESC>', { silent = true })

-- save and load session
vim.keymap.set('n', '<C-s><C-s>', '<cmd>mks! ~/session.nvim<CR>')
vim.keymap.set('n', '<C-s><C-l>', '<cmd>source ~/session.nvim<CR>', { silent = true })

-- buffline
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })

-- save and quit
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>q!<CR>')
vim.keymap.set('n', '<leader>ca', '<cmd>%bd|e#|bd#<CR>', { silent = true, desc = "Close others" })
vim.keymap.set('n', '<leader>c', '<cmd>bp | sp | bn | bd!<CR>')

vim.keymap.set({ 'n', 'v' }, '<C-u>', '{')
vim.keymap.set({ 'n', 'v' }, '<C-d>', '}')
