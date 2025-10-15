-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- Custom cmds for auto-format whole project
vim.api.nvim_create_user_command("FormatProject", function()
  local conform = require("conform")
  local root = vim.fn.getcwd()
  local files = vim.fn.glob(root .. "/**/*", true, true)

  for _, file in ipairs(files) do
    if vim.fn.filereadable(file) == 1 then
      local bufnr = vim.fn.bufadd(file)
      vim.fn.bufload(bufnr)

      -- Skip if buffer is special (not a normal file)
      if vim.bo[bufnr].buftype ~= "" then
        goto continue
      end

      vim.bo[bufnr].modifiable = true

      local ft = vim.bo[bufnr].filetype
      local has_formatter = conform.formatters_by_ft
        and conform.formatters_by_ft[ft]
        and #conform.formatters_by_ft[ft] > 0

      if has_formatter then
        local ok, err = pcall(function()
          conform.format({
            bufnr = bufnr,
            async = false,
            lsp_fallback = true,
          })

          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("write")
          end)
        end)

        if not ok then
          vim.notify("Failed to format: " .. file .. "\n" .. err, vim.log.levels.WARN)
        end
      end
    end
    ::continue::
  end
end, {})

-- Custom cmd to copy current file path to clipboard
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
