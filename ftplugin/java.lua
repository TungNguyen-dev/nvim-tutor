vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config = jdtls_path .. "/config_linux" -- or config_mac/config_win

require('jdtls').start_or_attach({
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-jar", launcher_jar,
    "-configuration", config,
    "-data", vim.fn.expand("~/.cache/jdtls/workspace")
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml' }, { upward = true })[1]),
  autostart = true,
})
