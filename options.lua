return {
  opt = {
    relativenumber = false,
    number = true,
    spell = false,
    signcolumn = "auto",
    wrap = false,
    ignorecase = true, -- ignores case during search
    showtabline = 0,
  },
  g = {
    mapleader = " ",
    autoformat_enabled = true,
    cmp_enabled = true,
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3,
    icons_enabled = true,
    ui_notifications_enabled = true,
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
