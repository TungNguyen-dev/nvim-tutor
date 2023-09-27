local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    mapping = {},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    file_ignore_patterns = {
      '.git',
      '.idea',
    },
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
      preview_width = 0.5,
    }
  },
  pickers = {
    find_files = {},
  },
  extensions = {}
}
