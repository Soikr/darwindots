local ok, apps = pcall(require, "icon_map")
if not ok then
  apps = {}
end

return setmetatable({
  ["Legcord"] = ":discord:",
  ["Dorion"] = ":discord:",
}, {
  __index = apps,
})
