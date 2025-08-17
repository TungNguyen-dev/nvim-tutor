-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
wk.add({
  -- Insert mode
  {
    mode = "i",
    { "jk", "<ESC>", desc = "Exit insert mode" },
  },
  -- Normal mode window resizing and Neo-tree
  {
    mode = "n",
    { "<A-Up>", ":resize +2<CR>", desc = "Resize window up", silent = true },
    { "<A-Down>", ":resize -2<CR>", desc = "Resize window down", silent = true },
    { "<A-Left>", ":vertical resize -2<CR>", desc = "Resize window left", silent = true },
    { "<A-Right>", ":vertical resize +2<CR>", desc = "Resize window right", silent = true },
    { "<leader>ec", "<cmd>Neotree position=current<CR>", desc = "Neo-tree: Open in current window" },
    { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open CopilotChat" },
    { "<leader>ao", "<cmd>AerialOpen<cr>", desc = "Open Aerial" },
  },
})
