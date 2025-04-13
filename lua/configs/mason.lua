-- Mason
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local status_ok_mason_tool_installer, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok_mason_tool_installer then
	return
end

local handlers = require("configs.lsp.handlers")
local lsp_servers = handlers.servers
local formatters = {
	"stylua",
	"shfmt",
	"google-java-format",
	"prettier",
}

mason_tool_installer.setup({
	ensure_installed = vim.tbl_extend("force", lsp_servers, formatters),
})
