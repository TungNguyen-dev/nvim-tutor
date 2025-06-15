local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  -- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  -- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

return {
  "neovim/nvim-lspconfig",
  version = "v1.7.0",
  config = function()
    local lspconfig = require('lspconfig')

    -- Those are defined in https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    -- Those are used to add config to that corresponding server
    -- Names of those are not name of LSP-Server.
    local lsp_servers = {
      'bashls', 'vimls', 'lua_ls', 'ts_ls'
    }

    local opts = {
      on_attach = on_attach
    }
    for _, server in pairs(lsp_servers) do
      server = vim.split(server, "@")[1]

      local status_ok, settings = pcall(require, "plugins.lsp.settings." .. server)
      if status_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      lspconfig[server].setup(opts)
    end
  end
}
