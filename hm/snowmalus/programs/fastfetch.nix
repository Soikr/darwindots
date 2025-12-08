{
  programs.fastfetch.enable = true;

  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "display": {
        "separator": "->  ",
        "color": {
          "separator": "red"
        },
        "constants": [
          "────────────────────────────────────────────────────",
          "│\u001b[52C│\u001b[52D"
        ]
      },
      "modules": [
        {
          "format": "{#1}{#keys}╭{$1}╮\u001b[36D {user-name-colored}{at-symbol-colored}{host-name-colored} 🖥  ",
          "type": "title"
        },
        {
          "key": "{$2}{#31}{icon} System   ",
          "format": "MacOS {codename} [{version}]",
          "type": "os"
        },
        {
          "key": "{$2}{#32} Host     ",
          "format": "{name}",
          "type": "host"
        },
        {
          "key": "{$2}{#33}󰅐 Uptime   ",
          "type": "uptime"
        },
        {
          "key": "{$2}{#34} Packages ",
          "format": "[Nix -> {nix-all}] [Brew -> {brew-all}]",
          "type": "packages"
        },
        {
          "key": "{$2}{#34} Shell    ",
          "format": "{pretty-name} [{version}]",
          "type": "shell"
        },
        {
          "key": "{$2}{#35} Term     ",
          "format": "{pretty-name} [{version}]",
          "type": "terminal"
        },
        {
          "key": "{$2}{#35} Font     ",
          "format": "{name} [{size}pt]",
          "type": "terminalfont"
        },
        {
          "key": "{$2}{#35}󰍛 CPU      ",
          "format": "{name} [{cores-logical} Cores]",
          "type": "cpu"
        },
        {
          "key": "{$2}{#34}󰍛 GPU      ",
          "format": "{name} [{type}]",
          "type": "gpu"
        },
        {
          "key": "{$2}{#33}󰉉 Disk     ",
          "format": "[{size-used} / {size-total}] [{filesystem}]",
          "type": "disk",
          "folders": "/"
        },
        {
          "key": "{$2}{#32} Memory   ",
          "format": "[{used} / {total}] ({percentage})",
          "type": "memory"
        },
        {
          "key": "{$2}{#31}󰩟 Network  ",
          "type": "localip",
          "format": "{ipv4} ({ifname})"
        },
        {
          "format": "{#1}{#keys}├{$1}┤",
          "type": "custom"
        },
        {
          "key": "{$2}{#39} colors   ",
          "type": "Colors",
          "symbol": "circle"
        },
        {
          "format": "{#1}{#keys}╰{$1}╯",
          "type": "custom"
        }
      ]
    }
  '';
}
