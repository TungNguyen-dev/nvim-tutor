local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here.
  -- Have packer manage itself.
  use "wbthomason/packer.nvim"

  -- Colorschemes --
  use {
    'folke/tokyonight.nvim',
    tag = 'v4.11.0',
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.3',
    run = ':TSUpdate',
  }

  -- LSP Server Manager
  use {
    "williamboman/mason.nvim", tag = 'v1.11.0',
    "williamboman/mason-lspconfig.nvim", tag = 'v1.32.0',
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    tag = 'v1.7.0'
  }

  -- Completion
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    "NeogitOrg/neogit",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-tree/nvim-web-devicons",
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',   -- Comment.
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring' -- Config specific for programming language.
    },
  }

  -- Terminal Integration
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.13.1'
  }

  -- Decorate workspace
  use {
    'nvim-lualine/lualine.nvim', -- Statusline
    'akinsho/bufferline.nvim',   -- Tabline
    'RRethy/vim-illuminate',     -- Cursorline
    'goolord/alpha-nvim',        -- Startup
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
