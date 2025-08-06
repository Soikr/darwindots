local nordic = {
  bg = "#1d1e21",
  border = "#6d90b0",
  surface = "#2a2e33",
  text = "#d4be98",
  apps = "#ddc7a1",
  accent = "#6d90b0",

  transparent = "0x00000000",
}

local colorscheme = {}

local function use(colors)
  for key, color in pairs(colors) do
    if color:sub(1, 1) == "#" then
      colorscheme[key] = "0xff" .. color:sub(2)
    elseif #color == 6 then
      colorscheme[key] = "0xff" .. color
    else
      colorscheme[key] = color
    end
  end
end

use(nordic)

return colorscheme
