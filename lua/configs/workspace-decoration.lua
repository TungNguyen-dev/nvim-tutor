require('lualine').setup({
  options = {
    theme = 'dracula'
  }
})

require('bufferline').setup()

require('illuminate').configure()

local dashboard = require('alpha.themes.dashboard')
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
require('alpha').setup(dashboard.opts)
