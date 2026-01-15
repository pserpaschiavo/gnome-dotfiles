local status, lualine = pcall(require, "lualine")
if not status then return end

-- Paleta Rainbow extraída do seu Starship toml
local colors = {
  orange = '#d65d0e', -- Gruvbox orange
  yellow = '#d79921', -- Gruvbox yellow
  aqua   = '#689d6a', -- Gruvbox aqua
  blue   = '#458588', -- Gruvbox blue
  bg1    = '#3c3836', -- Gruvbox dark bg
  fg0    = '#fbf1c7', -- Gruvbox light fg
  red    = '#cc241d', -- Gruvbox red
  green  = '#98971a', -- Gruvbox green
  purple = '#b16286', -- Gruvbox purple
  gray   = '#a89984', -- Gruvbox gray
}

local rainbow_theme = {
  normal   = {
    a = { fg = colors.fg0, bg = colors.orange, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.yellow },
    c = { fg = colors.fg0, bg = colors.bg1 },
    z = { fg = colors.fg0, bg = colors.blue },
  },
  insert   = {
    a = { fg = colors.fg0, bg = colors.aqua, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.blue },
    c = { fg = colors.fg0, bg = colors.bg1 },
    z = { fg = colors.fg0, bg = colors.aqua },
  },
  visual   = {
    a = { fg = colors.fg0, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.gray },
    c = { fg = colors.fg0, bg = colors.bg1 },
    z = { fg = colors.fg0, bg = colors.purple },
  },
  replace  = {
    a = { fg = colors.fg0, bg = colors.red, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.orange },
    c = { fg = colors.fg0, bg = colors.bg1 },
    z = { fg = colors.fg0, bg = colors.red },
  },
  command  = {
    a = { fg = colors.fg0, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.yellow },
    c = { fg = colors.fg0, bg = colors.bg1 },
    z = { fg = colors.fg0, bg = colors.green },
  },
  inactive = {
    a = { fg = colors.gray, bg = colors.bg1 },
    b = { fg = colors.gray, bg = colors.bg1 },
    c = { fg = colors.gray, bg = colors.bg1 },
    z = { fg = colors.gray, bg = colors.bg1 },
  },
}

lualine.setup({
  options = {
    theme = rainbow_theme, -- Usando paleta Gruvbox expandida
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'branch', 'filename' },
    lualine_c = { 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
  },
})