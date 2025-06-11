local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local LIST_WORKSPACES = "aerospace list-workspaces --all"
local LIST_CURRENT = "aerospace list-workspaces --focused"
local LIST_APPS = "aerospace list-windows --workspace %s | awk -F'|' '{gsub(/^ *| *$/, \"\", $2); print $2}'"

local workspaces = {}

local icon_cache = {}

local function getIconForApp(appName)
	if icon_cache[appName] then
		return icon_cache[appName]
	end
	local icon = icons["apps"][appName] or icons["apps"]["Default"] or "?"
	icon_cache[appName] = icon
	return icon
end

local function updateApps()
  for _,spaceID in pairs(workspaces) do
    if spaceID then
      sbar.exec(LIST_APPS:format(spaceID), function(appsList)
        local appSpace = "space." .. spaceID
    
        if not appsList then
          return
        end
    
        local icon = ""
        local shouldDraw = false
    
        for app in appsList:gmatch("[^\r\n]+") do
          local appName = app:match("^%s*(.-)%s*$")
          if appName and appName ~= "" then
            icon = icon .. getIconForApp(appName)
            shouldDraw = true
          end
        end
       
        sbar.set(appSpace, {
          label = {
            string = icon,
            drawing = shouldDraw
          }
        })
      end)
    end
  end
end

sbar.exec(LIST_WORKSPACES, function(spaces)
  for spaceID in spaces:gmatch("[^\r\n]+") do
    table.insert(workspaces, spaceID)
  end
  table.sort(workspaces, function(a, b)
    return a:lower() < b:lower()
  end)

  for i,spaceID in ipairs(workspaces) do
    local space = sbar.add("item", "space." .. spaceID, {
       icon = {
  		  font = { family = settings.font.numbers },
  		  string = spaceID,
  		  padding_left = 12,
  		  padding_right = 8,
  		  color = colors.foreground,
  		  highlight_color = colors.accent,
        y_offset = 1,
  	  },
  	  label = {
  		  padding_right = 0,
  		  padding_left = 1,
  		  color = colors.foreground,
  		  highlight_color = colors.accent,
  		  font = settings.apps .. 16.0
  	  },
  	  padding_left = 0,
  	  padding_right = 0,
  	  background = {
  		  border_width = 0,
  		  height = 24,
  		  color = colors.bg1,
  		},
    })

    space:subscribe("mouse.clicked", function()
      local highlighted = space:query().icon
      
      if highlighted["highlight"] ~= "on" then
	      sbar.exec("aerospace workspace " .. spaceID)
      end
    end)
  end

  sbar.set("space." .. workspaces[1], {
    padding_left = 4
  })

  sbar.set("space." .. workspaces[#workspaces], {
    padding_right = 8,
    label = {
      padding_right = 4
    }
  })

  local space_bracket = sbar.add("bracket", { '/space\\..*/' }, {
  	background = {
  		color = colors.bg1,
  		height = 26,
  		corner_radius = 4,
  	},
  })

  sbar.exec(LIST_CURRENT, function(focusedOutput)
    local spaceID = focusedOutput:match("[^\r\n]+")
    local spaceName = "space." .. spaceID
  
    sbar.set(spaceName, {
      icon = { highlight = true },
      label = { highlight = true }
    })
  
    updateApps()
  end)
end)

local function updateWorkspace(focused, previous)
  if not focused then
    updateApps()
    return
  end

  local focusedSpace = "space." .. focused

  sbar.set(focusedSpace, {
    icon = { highlight = true },
    label = { highlight = true }
  })

  if previous then
    local previousSpace = "space." .. previous

    sbar.set(previousSpace, {
      icon = { highlight = false },
      label = { highlight = false }
    })
  end
end

local observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

observer:subscribe(
  {"delta-workspace", "front_app_switched", "space_windows_change"}, function(env)
  local focused = env.focused
  local previous = env.previous
  
  updateWorkspace(focused, previous)
end)

