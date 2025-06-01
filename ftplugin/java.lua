-- Options for java
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Setup jdtls
local jdtls = require('jdtls')
local get_config = function()
  local home = vim.env.HOME -- Get the home directory
  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  local cmd_launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  local cmd_configuration = jdtls_path .. "/config_linux" -- Change to config_mac or config_win if needed
  local cmd_workspace_folder = vim.fn.expand("~/.cache/jdtls/workspace")

  -- Java Debug plugin JAR (must be built from java-debug)
  local bundles = {
    vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
  }

  return {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-jar", cmd_launcher_jar,
      "-configuration", cmd_configuration,
      "-data", cmd_workspace_folder
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml', 'build.gradle', '.git' }, { upward = true })[1]),
    autostart = true,
    init_options = {
      bundles = bundles
    },
    on_attach = function(client, bufnr)
      jdtls.setup_dap({ hotcodereplace = 'auto' })
      require("jdtls.dap").setup_dap_main_class_configs()
    end
  }
end
jdtls.start_or_attach(get_config())
