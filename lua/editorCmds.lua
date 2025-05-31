local editorCmds = {}

function editorCmds.setup()
  vim.api.nvim_create_user_command('Touch', function()
    vim.cmd 'enew'
    require('oil').open()
  end, {
    nargs = 0,
    desc = 'New Buffer w/ oil.nvim',
  })
  vim.api.nvim_create_user_command('Num', function()
    local on = vim.wo.number or vim.wo.relativenumber
    vim.opt.number = not on
    vim.opt.relativenumber = not on
  end, { desc = 'Toggle Hybrid number' })
end

return editorCmds
