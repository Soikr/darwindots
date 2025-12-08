local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

sbar.exec("launchctl unload -F /System/Library/LaunchAgents/com.apple.OSDUIHelper.plist >/dev/null 2>&1 &")

local volume_slider = sbar.add("slider", "widgets.volume.slider", 100, {
  position = "right",
  padding_right = 8,
  label = { drawing = false },
  icon = { drawing = false },
  slider = {
    highlight_color = colors.accent,
    width = 0,
    background = { height = 12, corner_radius = 5, color = colors.surface },
    knob = { string = "􀀁", drawing = false },
  },
})

local volume_icon = sbar.add("item", "widgets.volume.icon", {
  position = "right",
  padding_left = 4,
  padding_right = 4,
  icon = { drawing = false },
  label = {
    padding_left = 2,
    width = 25,
    align = "center",
    font = { style = settings.nerd_font, size = 15 },
  },
})

sbar.add("bracket", "widgets.volume.bracket", { volume_icon.name, volume_slider.name }, {
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
})

volume_slider:subscribe("mouse.clicked", function(env)
  sbar.exec("osascript -e 'set volume output volume " .. env.PERCENTAGE .. "'")
end)

volume_slider:subscribe("volume_change", function(env)
  local new_volume = tonumber(env.INFO)
  local icon = new_volume > 60 and icons.volume._100
      or new_volume > 30 and icons.volume._66
      or new_volume > 10 and icons.volume._33
      or new_volume > 0 and icons.volume._10
      or icons.volume._0
  volume_icon:set({ label = icon })
  volume_slider:set({ slider = { percentage = new_volume } })
end)

volume_icon:subscribe("mouse.clicked", function()
  local width = tonumber(volume_slider:query().slider.width)
  sbar.animate("tanh", 30, function()
    volume_slider:set({ slider = { width = (width > 0 and 0 or 100) } })
  end)
end)

sbar.add("item", "widgets.volume.padding", {
  position = "right",
  width = settings.padding,
})

return {
  icon = volume_icon,
  slider = volume_slider,
}
