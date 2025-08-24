return {
  "nvim-neo-tree/neo-tree.nvim",
  tag = "3.20", -- choose the version/tag you want
  cmd = "Neotree", -- lazy-load only when :Neotree is executed
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["Z"] = "expand_all_nodes",
        },
      },
    },
  },
}
