local colorscheme = {}

local shared = {
  transparent = "0x000000"
}

local function useScheme(usedColors)
  for key,color in pairs(shared) do
    if #color == 6 then
      colorscheme[key] = "0xff" .. color
    elseif #color == 7 then
      colorscheme[key] = "0xff" .. color:sub(2)
    else
      colorscheme[key] = color
    end
  end
  for key,color in pairs(usedColors) do
    if #color == 6 then
      colorscheme[key] = "0xff" .. color
    elseif #color == 7 then
      colorscheme[key] = "0xff" .. color:sub(2)
    else
      colorscheme[key] = color
    end
  end
end

local gruvbox = {
  bg_dim = "#1d1617",
  bg0 = "#1d2021",
  bg1 = "#282828",

  fg0 = "#d4be98",
  fg1 = "#ddc7a1",

  red = "#ea6962",
  orange = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  aqua = "#89b482",
  blue = "#7daea3",
  purple = "#d3869b",

  grey0 = "#7c6464",
  grey1 = "#928374"
}

useScheme(gruvbox)

return {
  bg0 = colorscheme.bg0,
  bg1 = colorscheme.bg1,

  foreground = colorscheme.fg0,

  bar = {
    bg = colorscheme.bg0,
    border = colorscheme.bg_dim,
  },

  popup = {
    bg = colorscheme.bg0,
    border = colorscheme.bg_dim,
  },

  accent = colorscheme.blue,

  transparent = colorscheme.transparent,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end
}
