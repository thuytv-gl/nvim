local function rand_min_max(min, max)
  local cmin = math.ceil(min)
  local fmax = math.floor(max)
  return math.floor(math.random() * (fmax - cmin + 1) + cmin)
end

local function change_color(color)
  vim.api.nvim_set_hl(0, "LineNr", { bg = color, fg = '#000000' }) -- red, change as desired
end

function _G.set_winbar_color(opts)
  local color = opts.fargs[1]
  if color ~= nil then
    change_color(color)
  end
end

function _G.set_winbar_random_color()
  local min = 60
  local max = 220
  local r = rand_min_max(min, max)
  local g = rand_min_max(min, max)
  local b = rand_min_max(min, max)

  local color = string.format("#%02x%02x%02x", r, g, b)
  change_color(color)
end

-- Optional: Create a command to manually set a new random background
vim.api.nvim_create_user_command("WinbarColor", _G.set_winbar_color, { nargs="*" })
vim.api.nvim_create_user_command("WinbarRandomColor", _G.set_winbar_random_color, {})
