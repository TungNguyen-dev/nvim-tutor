-- Neovim Formatter Clients
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Utilities for file types
local filetypesUtils = require("formatter.filetypes")

formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			filetypesUtils.lua.stylua,
		},
		sh = {
			filetypesUtils.sh.shfmt,
		},
		java = {
			filetypesUtils.java.google_java_format,
		},
		javascript = {
			filetypesUtils.javascript.prettier,
		},
		json = {
			filetypesUtils.json.prettier,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
			-- Remove trailing whitespace without 'sed'
			-- require("formatter.filetypes.any").substitute_trailing_whitespace,
		},
	},
})

-- Create augroup for formatter autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local format_group = augroup("__formatter__", { clear = true })

-- Format all files on save
autocmd("BufWritePost", {
	group = format_group,
	pattern = "*",
	command = "FormatWrite",
})

-- Formatter hooks
autocmd("User", {
	group = format_group,
	pattern = "FormatterPre",
	callback = function()
		print("📥 Formatting started...")
	end,
})

autocmd("User", {
	group = format_group,
	pattern = "FormatterPost",
	callback = function()
		print("📤 Formatting completed.")
	end,
})
