-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
wk.add({
  -- ==========================
  -- Insert mode
  -- ==========================
  {
    mode = "i",
    { "jk", "<ESC>", desc = "Exit insert mode" },
  },
  -- ==========================
  -- Normal mode: Window Management
  -- ==========================
  {
    mode = "n",
    -- Resize windows
    { "<A-Up>", ":resize +2<CR>", desc = "Resize window up", silent = true },
    { "<A-Down>", ":resize -2<CR>", desc = "Resize window down", silent = true },
    { "<A-Left>", ":vertical resize -2<CR>", desc = "Resize window left", silent = true },
    { "<A-Right>", ":vertical resize +2<CR>", desc = "Resize window right", silent = true },
    -- Window navigation
    { "<C-h>", "<C-w>h", desc = "Move to left window" },
    { "<C-j>", "<C-w>j", desc = "Move to lower window" },
    { "<C-k>", "<C-w>k", desc = "Move to upper window" },
    { "<C-l>", "<C-w>l", desc = "Move to right window" },
    -- Plugins
    { "<leader>ec", "<cmd>Neotree position=current<CR>", desc = "Neo-tree: Open in current window" },
    { "<leader>ac", "<cmd>CopilotChat<cr>", desc = "Open CopilotChat" },
    { "<leader>ho", "<cmd>AerialOpen<cr>", desc = "Open Aerial" },
  },
  -- ==========================
  -- Terminal mode: Navigate between windows
  -- ==========================
  {
    mode = "t",
    { "<C-h>", [[<C-\><C-n><C-w>h]], desc = "Move to left window" },
    { "<C-j>", [[<C-\><C-n><C-w>j]], desc = "Move to lower window" },
    { "<C-k>", [[<C-\><C-n><C-w>k]], desc = "Move to upper window" },
    { "<C-l>", [[<C-\><C-n><C-w>l]], desc = "Move to right window" },
    { "<Esc>", [[<C-\><C-n>]], desc = "Exit terminal mode" },
  },
})
