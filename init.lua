-- Configure nvim --
require "options"
require "keymaps"
require "plugins"

-- Configure plugins --
require "plugin-config.colorscheme"   -- Color theme.
require "plugin-config.cmp"           -- Completion.
require "plugin-config.lsp"           -- LSP.
require "plugin-config.treesitter"    -- Language parser.
require "plugin-config.autopairs"     -- Autopairs {}, [], ...
require "plugin-config.comment"       -- Auto comment.
require "plugin-config.telescope"     -- Finder over lists.
require "plugin-config.nvim-tree"     -- File explorers. 
require "plugin-config.gitsigns"      -- Git tracking.
require "plugin-config.bufferline"    -- A snazzy buffer line.
require "plugin-config.null-ls"       -- Formatter and linter.
require "plugin-config.toggleterm"    -- Toggle terminal.
require "plugin-config.lualine"       -- Status line.
