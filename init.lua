-- Configuration for Nvim --
require("options")
require("keymaps")
require("plugins")

-- Basic configuration --
require("plugins.colorscheme")
require("plugins.nvim-tree")
require("plugins.telescope")

-- Terminal integration configuration --
require("plugins.toggleterm")

-- Git integration configuration --
require("plugins.git")

-- Programming language configuration --
require("plugins.treesitter")
require("plugins.mason")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.comment")
require("plugins.autopairs")
require("plugins.formatter")
require("plugins.spectre")

-- Configuration for workspace decoration --
require("plugins.statusline")
require("plugins.tabline")
require("plugins.cursorline")
require("plugins.startup")
