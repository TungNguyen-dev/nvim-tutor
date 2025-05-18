-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({
	-- Lazy itself
	{ "folke/lazy.nvim", lazy = true },

	-- Color Scheme
	{ "folke/tokyonight.nvim", version = "v4.11.0" },

	-- File Explorer
	{ "nvim-tree/nvim-tree.lua", version = "v1.11.0" },
	{ "nvim-tree/nvim-web-devicons", version = "v0.100" },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", version = "0.1.8" },

	-- Terminal Integration
	{ "akinsho/toggleterm.nvim", version = "v2.13.1" },

	-- Git Integration
	"lewis6991/gitsigns.nvim",
	"NeogitOrg/neogit",
	"nvim-lua/plenary.nvim",
	"sindrets/diffview.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", version = "v0.9.3", build = ":TSUpdate" },

	-- Mason and LSP
	{ "williamboman/mason.nvim", version = "v1.11.0" },
	{ "williamboman/mason-lspconfig.nvim", version = "v1.32.0" },
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{ "neovim/nvim-lspconfig", version = "v1.7.0" },

	-- Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",

	-- Formatting
	"mhartington/formatter.nvim",

	-- Utilities
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-autopairs",

	-- UI Enhancements
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"RRethy/vim-illuminate",
	"goolord/alpha-nvim",

	-- Search and Replace
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
})
