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
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

vim.api.nvim_create_autocmd({ "ExitPre" }, {
  callback = function()
    local shada_all = vim.api.nvim_exec("echo stdpath('state')", true) .. "/shada/main.shada.tmp.X"
    os.remove(shada_all)
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

-- close all buffer
vim.cmd[[command! Bclose :%bd|e#]]

vim.cmd [[
  function! NetrwToggle()
    if &ft ==# "netrw"
      Rex
    else
      Ex
    endif
  endfunction
]]

vim.api.nvim_create_user_command("OilToggle", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

  if current_filetype == "oil" then
    -- We use a command to go to the previous buffer
    vim.cmd("b#")
  else
    -- Open oil if not already in an oil buffer
    vim.cmd("Oil")
  end
end, { nargs = 0 })

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

