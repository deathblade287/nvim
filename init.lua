require 'options'
require 'keymaps'
require 'lazySetup'
require('editorCmds').setup()
require 'autoCmds'

-- Making "E-Ink" theme transparent
-- local set_hl = vim.api.nvim_set_hl
-- local mono = require('e-ink.palette').mono()
-- set_hl(0, 'Normal', { fg = mono[12], bg = 'NONE' })

vim.cmd [[
  syntax off
]]
vim.opt.termguicolors = false
vim.cmd 'highlight clear'
