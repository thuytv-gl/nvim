vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

local rust_file_augroup = vim.api.nvim_create_augroup("MyGroup", {
  clear = false
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  group = rust_file_augroup,
  callback = function()
    vim.keymap.set("n", "<M-r>", ":!cargo run<CR>")
    vim.keymap.set("n", "<M-t>", ":!cargo test -- --ignored<CR>")
  end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
-- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd "tabdo wincmd ="
--   end,
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

-- cd to current buffer's directory
vim.cmd[[command! Cd :cd %:p:h]]

vim.cmd [[
  function! NetrwToggle()
    if &ft ==# "netrw"
      Rex
    else
      Ex
    endif
  endfunction
]]

vim.cmd [[
function! GrepQuickFix(pat)
  let all = getqflist()
  for d in all
    if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
        call remove(all, index(all,d))
    endif
  endfor
  call setqflist(all)
endfunction
]]

vim.cmd[[command! -nargs=* Gqf call GrepQuickFix(<q-args>)]]
vim.cmd("syntax off")

vim.cmd[[command! Fold :set foldmethod=syntax]]
vim.cmd[[command! Nfold :set foldmethod=manual]]
