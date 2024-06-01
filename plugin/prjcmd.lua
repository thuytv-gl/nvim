local function exists(name)
    if type(name)~="string" then return false end
    return os.rename(name,name) and true or false
end

local function is_file(name)
    if type(name)~="string" then return false end
    if not exists(name) then return false end
    local f = io.open(name)
    if f then
        f:close()
        return true
    end
    return false
end

-- @params cmdstr string
local function run_cmd(cmdstr)
  return function()
    vim.cmd.new()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 120)
    vim.wo.winfixheight = true
    vim.api.nvim_command("terminal")
    local cr = vim.api.nvim_replace_termcodes("\r", true, true, true);
    vim.api.nvim_feedkeys(cmdstr .. cr, "t", false) -- Send the command and press Enter
  end
end

local prj_run_cmd_group = vim.api.nvim_create_augroup("ProjectRunCommand", { clear = true })

-- RUST
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = prj_run_cmd_group,
  callback = function()
    local pwd = vim.fn.getcwd()
    if is_file(pwd .. '/Cargo.toml') then
      vim.keymap.set("n", "<M-r>", run_cmd("cargo run"))
      vim.keymap.set("n", "<M-t>", run_cmd("cargo test -- --ignored"))
    end
  end
})

-- Clang
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = prj_run_cmd_group,
  callback = function()
    local pwd = vim.fn.getcwd()
    if is_file(pwd .. '/makefile') then
      vim.keymap.set("n", "<M-r>", run_cmd("make"))
    end
  end
})
