local keymap = vim.api.nvim_set_keymap

-- Set <space> as the leader key
keymap('', '<Space>', '<Nop>', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---- Normal MODE --
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
-- keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Page Movement
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Moves half a page up and centers' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Moves half a down up and centers' })

-- Navigating buffers
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- File Navigation
keymap('n', '<leader>e', ':Neotree<cr>', { desc = 'Open Neotree' })
keymap('n', '<leader>ff', ':Telescope file_browser<cr>', { desc = '[F]ind [Files] In Telescope Finder' })

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', {})
keymap('n', '<C-Down>', ':resize -2<CR>', {})
keymap('n', '<C-Left>', ':vertical resize -2<CR>', {})
keymap('n', '<C-Right>', ':vertical resize +2<CR>', {})

-- Navigate buffers
keymap('n', '<leader>nf', ':Touch<CR>', {})
keymap('n', '<C-t>', ':Touch<CR>', {})

keymap('n', '<leader>c', ':bdelete<CR>', {})

keymap('n', '<C-Tab>', ':bnext<CR>', {})
keymap('n', '<C-S-Tab>', ':bprevious<CR>', {})

keymap('n', '<leader>bn', ':bnext<CR>', {})
keymap('n', '<leader>bp', ':bprevious<CR>', {})

-- INSERT MODE --

-- VISUAL MODE --
keymap('v', '<A-j>', ':m .+1<CR>==', {})
keymap('v', '<A-k>', ':m .-2<CR>==', {})
keymap('v', 'p', '"_dP', {}) -- selecting and pasting

keymap('v', '<C-[>', '<gv', {})
keymap('v', '<C-]>', '>gv', {})

keymap('v', '<Esc>', '<Esc>:normal! <Esc>', { noremap = true }) -- the above 2 keybinds mess with escape's ability to exit visual mode
