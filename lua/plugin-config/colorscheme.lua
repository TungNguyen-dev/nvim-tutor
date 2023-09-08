local plugin = "tokyonight"

local status_ok, colorscheme = pcall(require, plugin)
if not status_ok then
  return
end

colorscheme.setup {
  style = "night",
  on_colors = function(colors)
    colors.bg = '#2B2B2B'
    colors.fg = '#F8F8F2'
    colors.orange = '#FFB86C'
    colors.yellow = '#FFFFA5'
    colors.gray = '#4D4D4D'
  end,
  on_highlights = function(highlights, colors)
    highlights.ColorColumn = {
      bg = colors.gray
    }
    highlights.LineNr = {
      fg = '#585B5D'
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
      fg = colors.yellow
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
