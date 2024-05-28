-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Normal --
-- Quick save
keymap("n", "<leader>w", "<cmd>w<CR>", {})
keymap("n", "<leader>c", "<cmd>call Bdelete()<CR>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<C-q>", "<cmd>call QuickFixToggle()<CR>", opts)
keymap("n", "<esc>", "<esc>", opts)
keymap("n", "<leader>rr", "*cgn", opts)

-- Curror movements
keymap("n", "gh", "<S-^>", opts)
keymap("n", "gl", "$", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize
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

keymap("n", "<leader>e", ":call NetrwToggle()<CR>", opts)
