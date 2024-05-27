local function exists(name)
    if type(name)~="string" then return false end
    return os.rename(name,name) and true or false
end

local function isFile(name)
    if type(name)~="string" then return false end
    if not exists(name) then return false end
    local f = io.open(name)
    if f then
        f:close()
        return true
    end
    return false
end
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

local prj_run_cmd_group = vim.api.nvim_create_augroup("ProjectRunCommand", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  group = prj_run_cmd_group,
  callback = function()
    local pwd = vim.fn.getcwd()
    if isFile(pwd .. '/Cargo.toml') then
      vim.keymap.set("n", "<M-r>", ":!cargo run<CR>")
      vim.keymap.set("n", "<M-t>", ":!cargo test -- --ignored<CR>")
    end
  end
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
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

vim.cmd [[
function! Bdelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            echo "Buffer deleted. Created new buffer."
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction
]]

vim.cmd[[command! -nargs=* Gqf call GrepQuickFix(<q-args>)]]

