local settings = require("settings")
local iconFont = settings.icons

local apps = {
  ["Default"] = ":default:",

  ["Activity Monitor"] = ":activity_monitor:",
  ["Android Studio"] = ":android_studio:",
  ["Anki"] = ":anki:",
  ["App Store"] = ":app_store:",
  ["Blender"] = ":blender:",
  ["Calculator"] = ":calculator:",
  ["Calendar"] = ":calendar:",
  ["Discord"] = ":discord:",
  ["Docker"] = ":docker:",
  ["Element"] = ":element:",
  ["Finder"] = ":finder:",
  ["Godot"] = ":godot:",
  ["IntelliJ IDEA"] = ":idea:",
  ["KeePassXC"] = ":kee_pass_x_c:",
  ["kitty"] = ":kitty:",
  ["SiYuan"] = ":maps:",
  ["System Preferences"] = ":gear:",
	["System Settings"] = ":gear:",
  ["Notes"] = ":notes:",
  ["Notion"] = ":notion:",
  ["OBS Studio"] = ":obsstudio:",
  ["Parsec"] = ":parsec:",
  ["Preview"] = ":pdf:",
  ["Photos"] = ":photos:",
  ["Proton VPN"] = ":proton_vpn:",
  ["PyCharm"] = ":pycharm:",
  ["Safari"] = ":safari:",
  ["SF Symbols"] = ":sf_symbols:",
  ["Terminal"] = ":terminal:",
  ["UTM"] = ":utm:",
  ["VSCodium"] = ":vscodium:",
  ["Xcode"] = ":xcode:",
  ["Zen"] = ":zen_browser:"
}

local icons = {
  ["sf-symbols"] = {
    plus = "􀅼",
    loading = "􀖇",
    apple = "􀣺",
    gear = "􀍟",
    cpu = "􀫥",
    clipboard = "􀉄",
    switch = {
      on = "􁏮",
      off = "􁏯",
    },
    volume = {
      _100="􀊩",
      _66="􀊧",
      _33="􀊥",
      _10="􀊡",
      _0="􀊣",
    },
    media = {
      back = "􀊊",
      forward = "􀊌",
      play_pause = "􀊈",
    },
  }
}

icons[iconFont]["apps"] = apps

return icons[iconFont]
