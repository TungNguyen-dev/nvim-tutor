local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local servers = { 'jdtls', 'ts_ls' };
for _, server in pairs(servers) do
  lspconfig[server].setup {}
end
