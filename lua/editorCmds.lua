local M = {}

function M.setup()
  vim.api.nvim_create_user_command('Touch', function(opts)
    local fname = opts.args
    local dir = vim.fn.fnamemodify(fname, ':p:h')
    vim.fn.mkdir(dir, 'p')
    if vim.fn.empty(vim.fn.glob(fname)) == 1 then
      local f = io.open(fname, 'w')
      if f then f:close() end
    end
    vim.cmd('edit ' .. vim.fn.fnameescape(fname))
  end, {
    nargs = 1,
    desc  = 'Create a new (empty) file and open it',
  })
end

return M
