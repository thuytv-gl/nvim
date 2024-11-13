vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode
