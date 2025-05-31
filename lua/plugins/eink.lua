return {
  'alexxGmZ/e-ink.nvim',
  priority = 1000,
  config = function()
    -- Load and activate the e-ink theme
    require('e-ink').setup()
    vim.cmd.colorscheme 'e-ink'
    vim.opt.background = 'dark'

    -- Grab the greyscale palette
    local mono   = require('e-ink.palette').mono()
    local set_hl = vim.api.nvim_set_hl

    -- Only override comments and strings:
    -- pick a mid-light grey (mono[4] = "#AEAEAE")
    set_hl(0, 'Comment', { fg = mono[4] })
    set_hl(0, 'String',  { fg = mono[4] })
  end,
}
