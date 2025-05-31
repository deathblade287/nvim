local keymap = vim.api.nvim_set_keymap
keymap('', '<Space>', '<Nop>', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable Arrow Navigation
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Buffer Navigation
-- keymap('n', '<C-h>', '<C-w><C-h>')
-- keymap('n', '<C-l>', '<C-w><C-l>')
-- keymap('n', '<C-j>', '<C-w><C-j>')
-- keymap('n', '<C-k>', '<C-w><C-k>')

-- Resize Buffers (w/ Arrows)
-- keymap('n', '<C-Up>', ':resize +2<CR>', {})
-- keymap('n', '<C-Down>', ':resize -2<CR>', {})
-- keymap('n', '<C-Left>', ':vertical resize -2<CR>', {})
-- keymap('n', '<C-Right>', ':vertical resize +2<CR>', {})

-- Page Movement
keymap('n', '<C-d>', '<C-d>zz', {})
keymap('n', '<C-u>', '<C-u>zz', {})

-- Esc Alternative(s)
-- keymap('i', 'jj', '<Esc>', {})
-- keymap('i', 'jk', '<Esc>', {})

-- File Navigation
keymap('n', '<leader>e', ':Neotree<cr>', { desc = 'Open Neotree' })

-- Managing Buffers
keymap('n', '<leader>bc', ':Touch<CR>', {})

keymap('n', '<leader>bd', ':bdelete<CR>', {})

keymap('n', '<Tab>', ':bnext<CR>', {})
keymap('n', '<S-Tab>', ':bprevious<CR>', {})

keymap('n', '<leader>bn', ':bnext<CR>', {})
keymap('n', '<leader>bp', ':bprevious<CR>', {})

keymap('v', '<A-j>', ':m .+1<CR>==', {})
keymap('v', '<A-k>', ':m .-2<CR>==', {})
keymap('v', 'p', '"_dP', {})

-- Indentation In All modes w/ Ctrl + [ \ ]
-- keymap('v', '<C-[>', '<gv', {})
-- keymap('v', '<C-]>', '>gv', {})

-- -- Treewalker
-- -- movement
-- keymap('n', '<C-,>', '<cmd>Treewalker Up<cr>', { silent = true })
-- keymap('n', '<C-.>', '<cmd>Treewalker Down<cr>', { silent = true })
--
-- -- swapping
-- keymap('n', '<C-S-,>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
-- keymap('n', '<C-S-.>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
