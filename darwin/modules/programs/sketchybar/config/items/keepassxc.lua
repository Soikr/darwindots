local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local keepass = sbar.add("alias", "KeePassXC,Item-0", {
	display = 1,
	position = "right",
	padding_left = -3,
	padding_right = -2,
	icon = { drawing = false },
	label = { drawing = false },
	width = "dynamic",
	click_script = [[
    osascript -e 'tell application "System Events" to tell process "KeePassXC"
      click menu bar item 1 of menu bar 2
      click menu item 2 of menu 1 of menu bar item 1 of menu bar 2
    end tell'
  ]],
})

local tray_bracket = sbar.add("bracket", "tray", {
  "KeePassXC,Item-0"
}, {
	display = 1,
	background = {
		color = colors.bg1,
		height = 26,
		corner_radius = 6,
		border_color = colors.bg1,
	},
	popup = { align = "center", height = 30 },
})

