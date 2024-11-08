local dimens <const> = require("config.dimens")

local fonts <const> = {
  text = "JetBrainsMono Nerd Font",
  numbers = "JetBrainsMono Nerd Font",

  icons = function(size)
    local font = "sketchybar-app-font:Regular"
    return size and font .. ":" .. size or font .. ":" .. dimens.text.icon
  end,

  styles = {
    regular = "Regular",
    medium = "Medium",
    semibold = "Semibold",
    bold = "Bold",
    heavy = "ExtraBold",
  }
}

return fonts
