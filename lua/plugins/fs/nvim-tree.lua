return {
  "nvim-tree/nvim-tree.lua",
  version = "v1.12.0",
  lazy = false,
  opts = function()
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open Finder" })

    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    end

    return {
      on_attach = my_on_attach,
      view = {
        width = {
          -- Solution in: https://github.com/nvim-tree/nvim-tree.lua/discussions/2915
          -- Keep window fit to the longest file name
          max = -1,
        }
      }
    }
  end
}
