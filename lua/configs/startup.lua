local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
-- Set header
dashboard.section.header.val = {
  [[···············································]],
  [[:                                             :]],
  [[:                                             :]],
  [[:   _____                      _   _  _   _   :]],
  [[:  |_   _|_   _  _ __    __ _ | \ | || \ | |  :]],
  [[:    | | | | | || '_ \  / _` ||  \| ||  \| |  :]],
  [[:    | | | |_| || | | || (_| || |\  || |\  |  :]],
  [[:    |_|  \__,_||_| |_| \__, ||_| \_||_| \_|  :]],
  [[:                       |___/                 :]],
  [[:                                             :]],
  [[:                                             :]],
  [[···············································]],
}
alpha.setup(dashboard.opts)
