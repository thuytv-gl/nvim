local function rand_min_max(min, max)
  local cmin = math.ceil(min)
  local fmax = math.floor(max)
  return math.floor(math.random() * (fmax - cmin + 1) + cmin)
end
-- Optional: Create a command to manually set a new random background
vim.api.nvim_create_user_command("CColor", function(opts)
  vim.o.winbar = "%#SolidBar# %{getcwd()}"

  local color = opts.fargs[1]
  if color ~= nil then
    vim.api.nvim_set_hl(0, "SolidBar", { bg = color }) -- red, change as desired
  end

  local min = 60
  local max = 220
  local r = rand_min_max(min, max)
  local g = rand_min_max(min, max)
  local b = rand_min_max(min, max)

  local hex_color = string.format("#%02x%02x%02x", r, g, b)
  vim.api.nvim_set_hl(0, "SolidBar", { bg = hex_color }) -- red, change as desired
end, { nargs="*" })
