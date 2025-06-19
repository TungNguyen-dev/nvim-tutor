return {
  "stevearc/conform.nvim",
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      java = { "google-java-format" },
    },
    -- Customize formatters
    formatters = {
      ["google-java-format"] = {
        prepend_args = { "--aosp" }, -- Ensure 4-space indentation
      },
    },
  },
}
