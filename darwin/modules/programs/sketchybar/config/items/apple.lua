local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

-- Padding item required because of bracket
sbar.add("item", { width = 5 })

local apple = sbar.add("item", {
  icon = {
    font = { size = 17.0 },
    string = icons.apple,
    padding_right = 6,
    padding_left = 6,
  },
  label = { drawing = false },
  background = {
    color = colors.transparent,
  },
  padding_left = 1,
  padding_right = 1,
  click_script = "sbar_menus -s 0"
})

-- Double border for apple using a single item bracket
sbar.add("bracket", { apple.name }, {
	background = {
		color = colors.transparent,
		height = 30,
		border_color = colors.transparent,
	},
})

-- Padding item required because of bracket
sbar.add("item", { width = 7 })
