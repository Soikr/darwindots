local settings = require("settings")
local colors = require("colors")

local corner_rad = 5
local border_wid = 2

sbar.default({
  updates = "when_shown",
  icon = {
    color = colors.text,
    padding_left = settings.paddings,
    padding_right = settings.paddings,
    font = {
      family = settings.font,
      style = "Bold",
      size = 18,
    },
    background = {
      corner_radius = corner_rad,
      height = 30,
    },
  },
  label = {
    color = colors.text,
    padding_left = settings.paddings,
    padding_right = settings.paddings,
    font = {
      family = settings.font,
      style = "Semibold",
      size = 16.0,
    },
    background = {
      corner_radius = corner_rad,
      height = 30,
    },
  },
  background = {
    height = 30,
    corner_radius = corner_rad,
    border_width = border_wid,
    padding_left = settings.paddings,
    padding_right = settings.paddings,
  },
  popup = {
    height = 30,
    background = {
      color = colors.bg,
      border_color = colors.border,
      border_width = border_wid,
      corner_radius = corner_rad,
    },
  },
})
