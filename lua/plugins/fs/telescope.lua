return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required Lua plugin
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Telescope Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Telescope Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Telescope Help Tags" },
  },
  opts = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    defaults = {
      preview = false,
      sorting_strategy = 'ascending',
      layout_strategy = "center",
      layout_config = {
        width = 0.8,
        mirror = true,
      },
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      },
      -- External dependencies (install via system package manager):
      --   ripgrep: https://github.com/BurntSushi/ripgrep
      --   fd:      https://github.com/sharkdp/fd
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      file_ignore_patterns = {
        '.git',
        '.idea',
      },
    },
  },
}
