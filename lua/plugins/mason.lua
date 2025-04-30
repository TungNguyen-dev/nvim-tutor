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

-- Mason Lsp Config
local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
	return
end

local handlers = require("plugins.lsp.handlers")
mason_lspconfig.setup({
	ensure_installed = handlers.servers,
	automatic_installation = true,
})

-- Mason Tool Installer
local status_ok_mason_tool_installer, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok_mason_tool_installer then
	return
end

local formatters = {
	"stylua",
	"shfmt",
	"google-java-format",
	"prettier",
}
mason_tool_installer.setup({
	ensure_installed = formatters,
	automatic_installation = true,
})
