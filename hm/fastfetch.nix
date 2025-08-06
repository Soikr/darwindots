{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "break"
        {
          type = "os";
          format = "MacOS {codename} [{version}]";
          keyColor = "red";
        }
        {
          type = "host";
          format = "{name}";
          keyColor = "yellow";
        }
        {
          type = "uptime";
          keyColor = "blue";
        }
        {
          type = "packages";
          format = "[Nix -> {nix-all}] [Brew -> {brew-all}]";
          keyColor = "blue";
        }
        {
          type = "shell";
          format = "{pretty-name} [{version}]";
          keyColor = "magenta";
        }
        {
          type = "display";
          key = "Display:";
          format = "{width}x{height} [{refresh-rate}Hz]";
          keyColor = "magenta";
        }
        {
          type = "terminal";
          format = "{pretty-name} [{version}]";
          keyColor = "yellow";
        }
        {
          type = "terminalfont";
          key = "Font:";
          format = "{name} [{size}pt]";
          keyColor = "magenta";
        }
        {
          type = "cpu";
          format = "{name} [{cores-logical} Cores]";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{name}";
          keyColor = "blue";
        }
        {
          type = "memory";
          format = "[{used} / {total}] ({percentage})";
          keyColor = "yellow";
        }
        {
          type = "disk";
          format = "[{size-used} / {size-total}] [{filesystem}]";
          keyColor = "red";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
