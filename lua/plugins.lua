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
  use "folke/tokyonight.nvim"

  -- LSP --
  use {
    "neovim/nvim-lspconfig",
    requires = {
      { "williamboman/mason.nvim" },           -- LSP Servers Manager.
      { "williamboman/mason-lspconfig.nvim" }, -- Bridge manson and lsp.
    }
  }

  -- Snippets --
  use {
    "L3MON4D3/LuaSnip",
    requires = {
      { "rafamadriz/friendly-snippets" }, -- Snippets collection.
    },
  }

  -- Completion --
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp" },     -- Bridge cmp and lsp.
      { "saadparwaiz1/cmp_luasnip" }, -- Bridge cmp and snippets.
    },
  }

  -- Syntax --
  use {
    'nvim-treesitter/nvim-treesitter',
  }

  -- Fuzzy Finder --
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  -- File Explorer --
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- Bars and Lines --
  use {
    { 'nvim-lualine/lualine.nvim' }, -- Status line.
    { 'akinsho/bufferline.nvim' },   -- Buffer line.
  }

  -- Terminal Intergration --
  use { 'akinsho/toggleterm.nvim' } -- Toggle terminal.

  -- Git --
  use {
    'lewis6991/gitsigns.nvim',
  }

  -- Editing Support --
  use {
    { "windwp/nvim-autopairs" }, -- Autopairs.
    {
      -- Comment.
      "numToStr/Comment.nvim",
      requires = {
        -- Config specific for programming language.
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    }
  }

  -- Formatting --
  use {
    -- Indent blankline.
    "lukas-reineke/indent-blankline.nvim",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
