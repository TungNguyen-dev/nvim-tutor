local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
	return
end

spectre.setup({})

-- Toggle Spectre panel
vim.keymap.set("n", "<leader>S", function()
	spectre.toggle()
end, { desc = "Toggle Spectre", noremap = true, silent = true })

-- Search in current file
vim.keymap.set("n", "<leader>sw", function()
	spectre.open_visual({ select_word = true })
end, { desc = "Search current word (Spectre)", noremap = true, silent = true })

-- Open visual search with selected text
vim.keymap.set("v", "<leader>sw", function()
	spectre.open_visual()
end, { desc = "Search visual selection (Spectre)", noremap = true, silent = true })

-- Search in current file only
vim.keymap.set("n", "<leader>sp", function()
	spectre.open_file_search({ select_word = true })
end, { desc = "Search in current file (Spectre)", noremap = true, silent = true })
