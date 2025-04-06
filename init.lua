-- Configuration for Nvim --
require "options"
require "keymaps"
require "plugins"

-- Basic configuration --
require "configs.colorscheme"
require "configs.nvim-tree"
require "configs.telescope"

-- Terminal integration configuration --
require "configs.terminal"

-- Git integration configuration --
require "configs.git"

-- Programming language configuration --
require "configs.treesitter"
require "configs.mason-lsp"
require "configs.lsp"
require "configs.cmp"
require "configs.comment"

-- Configuration for workspace decoration --
require "configs.statusline"
require "configs.tabline"
require "configs.cursorline"
require "configs.startup"
