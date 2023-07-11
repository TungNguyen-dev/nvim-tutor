return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = root_pattern("composer.json", ".git"),
}
