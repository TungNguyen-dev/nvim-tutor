local plugin = "tokyonight"

local status_ok, colorscheme = pcall(require, plugin)
if not status_ok then
  return
end

colorscheme.setup {
  style = "night",
  on_colors = function(colors)
    colors.bg = '#141414'
    colors.fg = '#AAAFD2'
    colors.orange = '#FFB86C'
    colors.yellow = '#F0FA46'
    colors.gray = '#B4B4B4'
    colors.green = '#59A571'
    colors.green1 = '#71D090'
  end,
  on_highlights = function(highlights, colors)
    highlights.LineNr = {
      fg = colors.blue,
    }
    highlights.Delimiter = {
      fg = colors.white
    }
    highlights.Type = {
      fg = colors.orange
    }
    highlights.Statement = {
      fg = colors.orange
    }
    highlights.PreProc = {
      fg = colors.orange
    }
    highlights.Operator = {
      fg = colors.white
    }
    highlights.Function = {
      fg = colors.yellow
    }
    highlights.Comment = {
      fg = colors.green1
    }
    highlights.Constant = {
      fg = colors.white
    }
    highlights.phpRegion = {
      fg = colors.white
    }
    highlights.phpParent = {
      fg = colors.white
    }
    highlights.phpSpecialFunction = {
      fg = colors.yellow
    }
    highlights.phpMethodsVar = {
      fg = colors.orange
    }
    highlights.phpMemberSelector = {
      fg = colors.white
    }
    highlights.phpVarSelector = {
      fg = colors.magenta
    }
    highlights.phpComparison = {
      fg = colors.white
    }
  end
}
vim.cmd('colorscheme ' .. plugin)
