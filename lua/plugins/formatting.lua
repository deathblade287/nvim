return {
  'tpope/vim-sleuth',
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'autopep8' },
        javascript = { { 'prettierd', 'prettier' } },
        c = { 'clang-format' },
      },
    },
  },
}
