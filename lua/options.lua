-- NOTE:  For more options, you can see `:help option-list`

-- Basic Editor Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.tabstop = 4

-- UI/UX Enhancements
vim.opt.guicursor = 'n-v-i-c:block-Cursor'
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'
vim.g.have_nerd_font = true

-- Editing Experience
vim.opt.confirm = true
vim.opt.scrolloff = 30
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Search and Pattern Matching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard and Mouse Integration
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Split Window Behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
