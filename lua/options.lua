-- NOTE:  For more options, you can see `:help option-list`

-- Basic Editor Options
vim.opt.number = false -- Enabling both number and relativenumber puts you in hybrid mode
vim.opt.relativenumber = false
vim.opt.showmode = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- UI/UX Enhancements
vim.opt.guicursor = 'n-v-i-c:block-Cursor'
vim.opt.cursorline = false
vim.opt.laststatus = 0
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
-- vim.opt.statuscolumn = '%s│ '
vim.opt.inccommand = 'split'
vim.g.have_nerd_font = true

-- Editing Experience
vim.opt.confirm = true
vim.opt.scrolloff = 5
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Search and Pattern Matching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard and Mouse Integration
vim.opt.mouse = 'a'

-- Split Window Behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
