-- Key map options
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal
keymap("n", "<leader>g", ":ToggleTerm<CR>", opts)
keymap("t", "<C-t>", [[<C-\><C-n>]], opts)
keymap("t", "<esc>", [[<C-\><C-n>]], opts)
keymap("t", "jk", [[<C-\><C-n>]], opts)

local term_opts = { silent = true }
keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], term_opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], term_opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], term_opts)
keymap("t", "<C-l>", [[<C-\><C-n><C-W>l]], term_opts)

-- Nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
local status_ok_telescope, telescope_builtin = pcall(require, "telescope.builtin")
if status_ok_telescope then
	vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
end

-- Formatter
keymap("n", "<leader>f", ":Format<cr>", opts)
keymap("n", "<leader>F", ":FormatWrite<cr>", opts)

-- Nvim spectre
keymap("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', opts)
keymap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)
keymap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<cr>', opts)
