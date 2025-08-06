local apps = require("icon_map")

return setmetatable({
  ["Legcord"] = ":discord:",
  ["Font Book"] = ":sioyek:",
  ["LaunchControl"] = "󱓞",
  ["Roblox"] = "􀛹",
  ["RobloxPlayer"] = "􀛹",
}, {
  __index = apps,
})
