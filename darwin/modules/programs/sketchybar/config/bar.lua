local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 30,
  color = colors.bar.bg,
  border_color = colors.bar.border,
  shadow = true,
  sticky = true,
  padding_right = 5,
  padding_left = 5,
  topmost="window",
})
