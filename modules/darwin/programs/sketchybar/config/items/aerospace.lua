local colors = require("colors")
local settings = require("settings")
local app_icons = require("apps")

local function update_space_icons(space, space_name)
  sbar.exec("aerospace list-windows --format %{app-name} --workspace " .. space_name, function(windows)
    local icons, seen = {}, {}
    for app in windows:gmatch("[^\r\n]+") do
      local icon = app_icons[app]
      if icon and not seen[icon] then
        seen[icon] = true
        icons[#icons + 1] = icon
      end
    end
    if #icons > 0 then
      sbar.animate("tanh", 10, function()
        space:set({ label = { string = table.concat(icons, " "), drawing = true } })
      end)
    else
      space:set({ label = { drawing = false } })
    end
  end)
end

local function create_space_item(space_name)
  local id = "space." .. space_name
  local space = sbar.add("item", id, {
    icon = {
      string = string.sub(space_name, 1, 2),
      padding_left = 8,
      padding_right = 8,
      highlight_color = colors.accent,
    },
    label = {
      drawing = false,
      color = colors.apps,
      font = "sketchybar-app-font:Regular:16.0",
      padding_left = 10,
      padding_right = 10,
      y_offset = -1,
      background = {
        height = 26,
        color = colors.surface,
      },
    },
    padding_left = 2,
    padding_right = 2,
  })

  space:subscribe("mouse.clicked", function()
    sbar.exec("aerospace workspace " .. space_name)
  end)

  space:subscribe("space_windows_change", function()
    update_space_icons(space, space_name)
  end)

  space:subscribe("delta-workspace", function(env)
    local selected = env.focused == space_name
    sbar.animate("tanh", 10, function()
      space:set({
        icon = { highlight = selected },
        label = { width = selected and 0 or "dynamic" },
      })
    end)
    if selected then
      update_space_icons(space, space_name)
    end
  end)

  return id
end

sbar.exec("aerospace list-workspaces --all", function(spaces)
  local space_ids = {}
  for space_name in spaces:gmatch("[^\r\n]+") do
    space_ids[#space_ids + 1] = create_space_item(space_name)
  end

  local aerospace_bracket = sbar.add("bracket", space_ids, {
    background = {
      color = colors.bg,
      border_color = colors.border,
    },
  })

  sbar.add("item", "aerospace.padding", {
    script = "",
    width = settings.padding,
  })

  sbar.exec(string.format("sketchybar --reorder %s aerospace.padding front_app", aerospace_bracket.name))
end)
