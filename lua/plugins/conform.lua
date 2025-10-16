return {
  "stevearc/conform.nvim",
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      java = { "google-java-format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      xml = { "xmllint" },

      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "prettier" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}
