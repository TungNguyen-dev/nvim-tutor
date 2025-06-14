-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                          Global Keymap Configuration                         │
-- ╰──────────────────────────────────────────────────────────────────────────────╯

-- Base keymap options
local opts = { noremap = true, silent = true }

-- Keymap function using modern API (required for 'desc')
local keymap = vim.keymap.set

-- ╭───────────────────────┬──────────────────────────────────────────────────────╮
-- │ Section: Normal Mode  │                                                      │
-- ╰───────────────────────┴──────────────────────────────────────────────────────╯

-- File operations
keymap("n", "<leader>w", ":w<CR>", vim.tbl_deep_extend("force", opts, { desc = "Save current buffer." }))
keymap("n", "<leader>q", ":q!<CR>", vim.tbl_deep_extend("force", opts, { desc = "Quit current window." }))
keymap("n", "<leader>Q", ":qa!<CR>", vim.tbl_deep_extend("force", opts, { desc = "Quit app." }))

-- Split window
keymap("n", "<leader>sh", ":split<CR>", vim.tbl_deep_extend("force", opts, { desc = "Horizontal split" }))
keymap("n", "<leader>sv", ":vsplit<CR>", vim.tbl_deep_extend("force", opts, { desc = "Vertical split" }))

-- Navigate between windows
keymap("n", "<C-h>", "<C-w>h", vim.tbl_deep_extend("force", opts, { desc = "Move to left split" }))
keymap("n", "<C-j>", "<C-w>j", vim.tbl_deep_extend("force", opts, { desc = "Move to below split" }))
keymap("n", "<C-k>", "<C-w>k", vim.tbl_deep_extend("force", opts, { desc = "Move to above split" }))
keymap("n", "<C-l>", "<C-w>l", vim.tbl_deep_extend("force", opts, { desc = "Move to right split" }))

-- Resize windows with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Increase window height" }))
keymap("n", "<A-Down>", ":resize -2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Decrease window height" }))
keymap("n", "<A-Right>", ":vertical resize +2<CR>",
  vim.tbl_deep_extend("force", opts, { desc = "Increase window width" }))
keymap("n", "<A-Left>", ":vertical resize -2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Decrease window width" }))

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", vim.tbl_deep_extend("force", opts, { desc = "Next buffer" }))
keymap("n", "<S-h>", ":bprevious<CR>", vim.tbl_deep_extend("force", opts, { desc = "Previous buffer" }))

-- ╭────────────────────────┬─────────────────────────────────────────────────────╮
-- │ Section: Insert Mode   │                                                     │
-- ╰────────────────────────┴─────────────────────────────────────────────────────╯

-- Quick escape
keymap("i", "jk", "<ESC>", vim.tbl_deep_extend("force", opts, { desc = "Exit insert mode" }))

-- ╭───────────────────────┬──────────────────────────────────────────────────────╮
-- │ Section: Visual Mode  │                                                      │
-- ╰───────────────────────┴──────────────────────────────────────────────────────╯

-- Stay in indent mode
keymap("v", "<", "<gv", vim.tbl_deep_extend("force", opts, { desc = "Indent left" }))
keymap("v", ">", ">gv", vim.tbl_deep_extend("force", opts, { desc = "Indent right" }))

-- ╭─────────────────────────────┬───────────────────────────────────────────────╮
-- │ Section: Visual Block Mode  │                                               │
-- ╰─────────────────────────────┴───────────────────────────────────────────────╯

-- Move selected text
keymap("x", "J", ":move '>+1<CR>gv-gv", vim.tbl_deep_extend("force", opts, { desc = "Move block down" }))
keymap("x", "K", ":move '<-2<CR>gv-gv", vim.tbl_deep_extend("force", opts, { desc = "Move block up" }))

-- ╭────────────────────────┬─────────────────────────────────────────────────────╮
-- │ Section: Terminal Mode │                                                     │
-- ╰────────────────────────┴─────────────────────────────────────────────────────╯

-- Exit terminal mode
keymap("t", "<C-t>", [[<C-\><C-n>]], vim.tbl_deep_extend("force", opts, { desc = "Exit terminal mode" }))
keymap("t", "<esc>", [[<C-\><C-n>]], vim.tbl_deep_extend("force", opts, { desc = "Exit terminal mode" }))
keymap("t", "jk", [[<C-\><C-n>]], vim.tbl_deep_extend("force", opts, { desc = "Exit terminal mode" }))

-- Terminal window navigation
keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], vim.tbl_deep_extend("force", opts, { desc = "Terminal move left" }))
keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], vim.tbl_deep_extend("force", opts, { desc = "Terminal move down" }))
keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], vim.tbl_deep_extend("force", opts, { desc = "Terminal move up" }))
keymap("t", "<C-l>", [[<C-\><C-n><C-W>l]], vim.tbl_deep_extend("force", opts, { desc = "Terminal move right" }))
