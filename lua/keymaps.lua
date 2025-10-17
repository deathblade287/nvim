local keymap = vim.api.nvim_set_keymap
keymap('', '<Space>', '<Nop>', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Page Movement
keymap('n', '<C-d>', '<C-d>zz', {})
keymap('n', '<C-u>', '<C-u>zz', {})

-- Buffers
keymap('n', '<leader>bd', ':bdelete<CR>', {})
keymap('n', '<Tab>', ':bnext<CR>', {})
keymap('n', '<S-Tab>', ':bprevious<CR>', {})
keymap('n', '<leader>bn', ':bnext<CR>', {})
keymap('n', '<leader>bp', ':bprevious<CR>', {})

keymap('v', 'p', '"_dP', {})

-- Indentation w/ C-j/k (can't do it with [] as C-[ is mapped as Esc)
keymap('v', '<C-j>', '<gv', {})
keymap('v', '<C-k>', '>gv', {})
