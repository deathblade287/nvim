return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "stable",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
  },

  colorscheme = "onedark",

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = { "markdown" },
      },
      timeout_ms = 0,
    },
  },

  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- create a new tab with the default file explorer (oil.nvim, in this case)
  vim.api.nvim_create_user_command("Touch", function()
    vim.cmd "enew"
    vim.cmd "edit ."
  end, {}),
}
