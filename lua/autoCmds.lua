vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight w/ Yank',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disabling Next Line Comment w/ Enter

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('FormatOptions', { clear = true }),
  pattern = '*',
  desc = 'Disabling Auto-Comment',
  callback = function()
    vim.opt_local.formatoptions:remove {
      'r',
      'o',
    }
  end,
})
