return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
    opts = {},
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "TODOs in telescope" },
    },
  },
}
