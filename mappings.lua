local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

return {
  n = {
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<C-s>"] = { ":w<cr>", desc = "Save File" },

    ["<C-Tab>"] = { ":bnext<cr>", desc = "Next Buffer" },
    ["<C-S-Tab>"] = { ":bprevious<cr>", desc = "Previous Buffer" },
    ["<C-t>"] = { ":Touch<cr>", desc = "New parrell (tab-like) buffer with file manager" },

    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },

    ["<C-f>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },

    ["<A-a>"] = { mark.add_file, desc = "Add file to harpoon" },
    ["<leader>a"] = { mark.add_file, desc = "Add file to harpoon" },

    ["<A-h>"] = { ui.toggle_quick_menu, desc = "Open harpoon UI" },
    ["<leader>h"] = { ui.toggle_quick_menu, desc = "Open harpoon UI" },

    ["<A-1>"] = { function() ui.nav_file(1) end, desc = "Harpoon File 1" },
    ["<A-2>"] = { function() ui.nav_file(2) end, desc = "Harpoon File 2" },
    ["<A-3>"] = { function() ui.nav_file(3) end, desc = "Harpoon File 3" },
    ["<A-4>"] = { function() ui.nav_file(4) end, desc = "Harpoon File 4" },
    -- ["<A-1>"] = { ui.nav_file(1), desc = "Harpoon File 1" },
    -- ["<A-2>"] = { ui.nav_file(1), desc = "Harpoon File 2" },
    -- ["<A-3>"] = { ui.nav_file(1), desc = "Harpoon File 3" },
    -- ["<A-4>"] = { ui.nav_file(1), desc = "Harpoon File 4" },
    ["<leader>fo"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },
    ["<leader>fr"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" }

  },
  t = {},
}
