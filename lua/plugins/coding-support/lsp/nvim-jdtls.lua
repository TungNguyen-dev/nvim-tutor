return {
  "mfussenegger/nvim-jdtls",
  version = "0.2.0",
  keys = {
    { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",            desc = "Go to Declaration" },
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",             desc = "Go to Definition" },
    { "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",                  desc = "Hover Documentation" },
    -- { "gI",         "<cmd>lua vim.lsp.buf.implementation()<CR>",         desc = "Go to Implementation" },
    -- { "gr",         "<cmd>lua vim.lsp.buf.references()<CR>",             desc = "Go to References" },
    { "gl",         "<cmd>lua vim.diagnostic.open_float()<CR>",          desc = "Show Diagnostic Float" },
    { "<leader>li", "<cmd>LspInfo<cr>",                                  desc = "LSP Info" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>",                           desc = "LSP Install Info" },
    -- { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",            desc = "Code Action" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Previous Diagnostic" },
    -- { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                 desc = "Rename Symbol" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>",         desc = "Signature Help" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>",          desc = "Diagnostic Loclist" },
  }
}
