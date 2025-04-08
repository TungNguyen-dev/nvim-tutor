local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "configs.lsp.mason";

-- Language specified config
local handlers = require "configs.lsp.handlers"
local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}
for _, server in pairs(handlers.servers) do
  server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "configs.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
handlers.setup()
