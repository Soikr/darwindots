local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
  icon = {
    color = colors.foreground,
    padding_left = 8,
    padding_right = 10,
    font = {
      style = settings.font.style_map["Black"],
      size = 13.0,
    },
  },
  label = {
    color = colors.foreground,
    padding_right = 8,
    width = 49,
    align = "right",
    font = {
      family = settings.font.numbers,
      size = 13.0
    }
  },
  position = "right",
  update_freq = 30,
  padding_left = 1,
  padding_right = 1,
  background = {
    color = colors.bg2,
  },
  click_script = "open -a 'Calendar'"
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal:set({ icon = os.date("%a %b %d"), label = os.date("%H:%M") })
end)
