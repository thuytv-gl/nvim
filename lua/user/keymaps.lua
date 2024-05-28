-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Don't include leading whitespace
keymap("o", "a'", "2i'", {})
keymap("o", 'a"', '2i"', {})
keymap("x", "a'", "2i'", {})
keymap("x", 'a"', '2i"', {})


-- Normal --
-- Quick save
keymap("n", "<leader>w", "<cmd>w<CR>", {})
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<C-q>", "<cmd>call QuickFixToggle()<CR>", opts)
keymap("n", "<esc>", "<esc>", opts)
keymap("n", "<leader>rr", "*cgn", opts)

-- Curror movements
keymap("n", "gh", "<S-^>", opts)
keymap("n", "gl", "$", opts)
-- keymap("n", "j", "gj")
-- keymap("n", "k", "gk")
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize
keymap("n", "<M-]>", ":vertical-resize -20<CR>", opts)
keymap("n", "<M-S-l>", ":vertical-resize 20<CR>", opts)
keymap("n", "<M-S-k>", "<C-w>=", opts)
keymap("n", "<M-[>", ":vertical-resize +20<CR>", opts)
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>d", ":t.<CR>", opts)

-- Insert --
-- Fast quick exit
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>e", ":call NetrwToggle()<CR>", opts)


-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ss", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
keymap("n", "<leader>st", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>sb", ":Telescope buffers<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Git
keymap("n", "<M-.>", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<C-[", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<C-]", ":Gitsigns next_hunk<CR>", opts)

keymap("n", "<leader><leader>m", ":marks<CR>", opts)

-- Example mapping to toggle outline
keymap("n", "<leader>o", ":Outline<CR>", opts)

-- Quickfix
keymap("n", "<leader>nn", ":cnext<CR>", opts)
keymap("n", "<leader>np", ":nprev<CR>", opts)

if vim.g.neovide then
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode

  vim.keymap.set('n', '<leader>q', function()
    for _, ui in pairs(vim.api.nvim_list_uis()) do
      if ui.chan and not ui.stdout_tty then
        vim.fn.chanclose(ui.chan)
      end
    end
  end, { noremap = true })
end
