local colors = require("colors")
local app_icons = require("apps")

local window_rewrite_map = {
  ["kitty"] = "Kitty",
}

local front_app = sbar.add("item", "front_app", {
  icon = {
    font = "sketchybar-app-font:Regular:16.0",
    string = ":kitty:",
    padding_left = 8,
  },
  label = {
    padding_left = 8,
    padding_right = 8,
  },
  updates = true,
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
})

front_app:subscribe("front_app_switched", function(env)
  local window_name = env.INFO
  local icon = app_icons[window_name]

  window_name = window_rewrite_map[window_name] or window_name

  front_app:set({
    icon = {
      string = icon or "",
      drawing = icon ~= nil,
    },
    label = {
      string = window_name,
    },
  })
end)
