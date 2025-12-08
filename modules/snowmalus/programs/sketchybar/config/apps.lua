local ok, apps = pcall(require, "icon_map")
if not ok then
  apps = {}
end

return setmetatable({
  ["Legcord"] = ":discord:",
  ["Font Book"] = ":sioyek:",
  ["LaunchControl"] = "󱓞",
  ["Roblox"] = "􀛹",
  ["RobloxPlayer"] = "􀛹",
}, {
  __index = apps,
})
