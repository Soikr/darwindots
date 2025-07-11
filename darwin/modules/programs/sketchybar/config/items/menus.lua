local settings = require "settings"

local menu_watcher = sbar.add("item", {
  drawing = false,
  updates = false,
})
local space_menu_swap = sbar.add("item", {
  drawing = false,
  updates = true,
})
sbar.add("event", "swap_menus_and_spaces")

local max_items = 15
local menu_items = {}
for i = 1, max_items, 1 do
  local menu = sbar.add("item", "menu." .. i, {
    drawing = false,
    icon = { drawing = false },
    background = { drawing = false },
    label = {
      font = {
        style = settings.font.style_map[i == 1 and "Heavy" or "Semibold"],
      },
      padding_left = 6,
      padding_right = 6,
    },
    click_script = "menus -s " .. i,
  })

  menu_items[i] = menu
end

sbar.add("bracket", { "/menu\\..*/" }, {})

local menu_padding = sbar.add("item", "menu.padding", {
  drawing = false,
  width = 5,
})

local function update_menus(env)
  sbar.exec("menus -l", function(menus)
    sbar.set("/menu\\..*/", { drawing = false })
    menu_padding:set { drawing = true }
    Id = 1
    for menu in string.gmatch(menus, "[^\r\n]+") do
      if Id < max_items then
        menu_items[Id]:set { label = menu, drawing = true }
      else
        break
      end
      Id = Id + 1
    end
  end)
end

menu_watcher:subscribe("front_app_switched", update_menus)

space_menu_swap:subscribe("swap_menus_and_spaces", function(env)
  local drawing = menu_items[1]:query().geometry.drawing == "on"
  if drawing then
    menu_watcher:set { updates = false }
    sbar.set("/menu\\..*/", { drawing = false })
    sbar.set("/space\\..*/", { drawing = true })
  else
    menu_watcher:set { updates = true }
    sbar.set("/space\\..*/", { drawing = false })
    update_menus()
  end
end)

return menu_watcher
