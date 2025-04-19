require 'options'
require 'keymaps'
require 'lazySetup'
require 'editorCmds'
require 'autoCmds'
-- require 'lazy-bootstrap'
-- require 'lazy-plugins'

-- vim.cmd 'colorscheme atlas' -- :contentReference[oaicite:2]{index=2}

-- 1. Enable true‐color
if vim.fn.has 'termguicolors' == 1 then
  vim.o.termguicolors = true
end

-- 2. When any colorscheme loads, clear bg on these groups
local function clear_bg(group)
  vim.api.nvim_set_hl(0, group, { bg = 'none', ctermbg = 'none' })
end

local transparent_groups = {
  'Normal',
  'NormalNC',
  'SignColumn',
  'Folded',
  'EndOfBuffer',
  'NonText',
  'PMenu',
  'PMenuSel',
  'PmenuSbar',
  'PmenuThumb',
  'VertSplit',
  'StatusLine',
  'StatusLineNC',
  'TabLine',
  'TabLineFill',
  'CursorLine',
  'CursorColumn',
  'ColorColumn',
}

vim.api.nvim_create_augroup('TransparentAtlas', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'TransparentAtlas',
  pattern = 'atlas',
  callback = function()
    for _, g in ipairs(transparent_groups) do
      clear_bg(g)
    end
  end,
})

-- 3. Load Atlas (fires the ColorScheme autocommand)
vim.cmd 'colorscheme atlas'

-- Making "E-Ink" theme transparent
-- local set_hl = vim.api.nvim_set_hl
-- local mono = require('e-ink.palette').mono()
-- set_hl(0, 'Normal', { fg = mono[12], bg = 'NONE' })
