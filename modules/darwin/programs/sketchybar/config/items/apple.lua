local icons = require("icons")
local colors = require("colors")

local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple = {}

apple.logo = sbar.add("item", "apple.logo", {
  icon = {
    string = icons.apple,
    font = { size = 20 },
    padding_left = 8,
    padding_right = 8,
  },
  label = { drawing = false },
  padding_left = 1,
  padding_right = 1,
  y_offset = 1,
  background = {
    color = colors.bg,
    border_color = colors.border,
  },
  popup = { height = 0 },
  click_script = popup_toggle,
})

local function popup_item(name, icon, label, click_script)
  return sbar.add("item", name, {
    position = "popup." .. apple.logo.name,
    icon = {
      string = icon,
      font = { size = 16 },
      padding_left = 4,
      padding_right = 4,
      width = 32,
      align = "center",
    },
    label = {
      string = label,
      align = "left",
      padding_left = 0,
      padding_right = 0,
    },
    background = { height = 20, drawing = true },
    click_script = click_script,
  })
end

local function divider_pad(name)
  return sbar.add("item", name, {
    position = "popup." .. apple.logo.name,
    icon = { drawing = false },
    label = { drawing = false },
    background = { height = 5, drawing = true },
  })
end

local function divider(name)
  return sbar.add("item", name, {
    position = "popup." .. apple.logo.name,
    icon = { drawing = false },
    label = { drawing = false },
    background = {
      color = colors.surface,
      height = 2,
      drawing = true,
    },
    padding_left = 7,
    padding_right = 7,
    width = 110,
  })
end

divider_pad("apple.divider_padding_top")

apple.about = popup_item("apple.about", icons.about, "About", "open -a 'About This Mac'; " .. popup_toggle)

divider_pad("apple.divider_padding_top_0")
divider("apple.divider_0")
divider_pad("apple.divider_padding_bottom_0")

apple.prefs = popup_item("apple.prefs", icons.preferences, "Settings", "open -a 'System Preferences'; " .. popup_toggle)
apple.activity =
    popup_item("apple.activity", icons.activity, "Activity", "open -a 'Activity Monitor'; " .. popup_toggle)
apple.terminal = popup_item("apple.terminal", icons.term, "Terminal", "open -a 'kitty'; " .. popup_toggle)

divider_pad("apple.divider_padding_top_1")
divider("apple.divider_1")
divider_pad("apple.divider_padding_bottom_1")

apple.sleep = popup_item("apple.sleep", icons.sleep, "Sleep", "pmset displaysleepnow; " .. popup_toggle)
apple.restart = popup_item(
  "apple.restart",
  icons.restart,
  "Restart",
  "osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; " .. popup_toggle
)
apple.shutdown = popup_item(
  "apple.shutdown",
  icons.shutdown,
  "Shutdown",
  "osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; " .. popup_toggle
)

divider_pad("apple.divider_padding_top_2")
divider("apple.divider_2")
divider_pad("apple.divider_padding_bottom_2")

apple.logout = popup_item(
  "apple.logout",
  icons.logout,
  "Log Out",
  "osascript -e 'tell application \"System Events\" to log out'; " .. popup_toggle
)

divider_pad("apple.divider_padding_bottom")

for _, item in ipairs({
  apple.about,
  apple.prefs,
  apple.activity,
  apple.terminal,
  apple.sleep,
  apple.restart,
  apple.shutdown,
  apple.logout,
}) do
  item:subscribe("mouse.clicked", function()
    apple.logo:set({ popup = { drawing = false } })
  end)
end

apple.padding = sbar.add("item", "apple.padding", { width = 7 })

return apple
