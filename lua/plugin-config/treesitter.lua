local status_ok, treesitter = pcall(require, "treesitter")
if not status_ok then
  return
end

treesitter.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {'html', 'css', 'javascript', 'php'},

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  highlight = {
    enable = true,
    disable = { 'css' },
  },

  autopairs = {
    enable = true,
  },

  indent = {
    enable = true,
    disable = { "css", 'javascript', "php" }
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,

    -- Config comment-string.
    config = {
      php = {
        __default = '// %s',
        __multiline = '/* %s */',
      },
    }
  },
}
