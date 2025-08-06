local settings = require("settings")
local colors = require("colors")

local time_item = sbar.add("item", "calendar.time", {
  label = {
    string = os.date("%H:%M"),
    padding_left = 12,
    padding_right = 12,
    font = { size = 14 },
  },
  position = "right",
  update_freq = 30,
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
})

sbar.add("item", "calendar.spacer", {
  position = "right",
  width = 8,
})

local date_item = sbar.add("item", "calendar.date", {
  label = {
    string = os.date("%b %d"),
    padding_left = 12,
    padding_right = 12,
    font = { size = 14 },
  },
  position = "right",
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
})

sbar.add("item", "calendar.padding", {
  position = "right",
  width = settings.padding,
})

time_item:subscribe({ "forced", "routine", "system_woke" }, function()
  time_item:set({ label = { string = os.date("%H:%M") } })
  date_item:set({ label = { string = os.date("%a %b %d") } })
end)
