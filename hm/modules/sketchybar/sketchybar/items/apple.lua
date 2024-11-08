local settings = require("config")

local apple = sbar.add("item", "apple", {
  icon = { string = settings.icons.text.apple },
  label = { drawing = false },
  click_script = "@bridges@/bin/menus -s 0"
})
