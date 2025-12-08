local settings = require("settings")
local colors = require("colors")

local keepassxc = sbar.add("item", "widgets.keepassxc", {
  icon = {
    drawing = false,
  },
  label = {
    padding_left = 8,
    padding_right = 8,
    color = colors.apps,
    font = "sketchybar-app-font:Regular:20.0",
    string = ":kee_pass_x_c:",
  },
  position = "right",
  padding_left = 1,
  padding_right = 1,
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
  click_script = "open -a 'KeePassXC'",
})

sbar.add("item", "widgets.keepassxc.padding", {
  position = "right",
  width = settings.padding,
})
