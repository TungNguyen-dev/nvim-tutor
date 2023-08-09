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
  use "lunarvim/darkplus.nvim"

  -- Completion --
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
  }

  -- Snippets --
  use {
    "L3MON4D3/LuaSnip",                   -- Snippets engine.
    requires = {
      { "rafamadriz/friendly-snippets" }, -- Snippets collection.
      { "saadparwaiz1/cmp_luasnip" },     -- Bridge cmp and snippets.
    },
  }

  -- LSP --
  use {
    "neovim/nvim-lspconfig",                   -- Enable LSP.
    requires = {
      { "williamboman/mason.nvim" },           -- LSP Servers Manager.
      { "williamboman/mason-lspconfig.nvim" }, -- Bridge manson and lsp.
      { "hrsh7th/cmp-nvim-lsp" },              -- Bridge cmp and lsp.
    }
  }

  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      -- { 'jose-elias-alvarez/null-ls.nvim' } -- Formatter and linter.
    }
  }

  -- Telescope --
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  -- Nvim tree --
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- Utilities --
  use {
    { 'lewis6991/gitsigns.nvim' },                    -- Git-signs.
    {
      'numToStr/Comment.nvim',                        -- Comment.
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring' -- Config specific for programming language.
      },
    },
    { "windwp/nvim-autopairs" },                -- Autopairs.
    { 'akinsho/bufferline.nvim' },              -- Buffer line.
    { 'akinsho/toggleterm.nvim' },              -- Toggle terminal.
    { 'nvim-lualine/lualine.nvim' },            -- Status line.
    { "lukas-reineke/indent-blankline.nvim" },  -- Indent blankline.
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
