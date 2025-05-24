return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local status_ok_telescope, telescope_builtin = pcall(require, "telescope.builtin")
    if status_ok_telescope then
      vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
    end
    return {}
  end
}
