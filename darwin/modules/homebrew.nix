{ ... }: {

  homebrew = {
    enable = true;

    global = {
      brewfile = true;
    };

    onActivation = {
      cleanup = "zap";
    };

    masApps = {};
    
    brews = [

      # System
      "sketchybar"

      # Lua/Roblox Development
      "lua"
      "lua-language-server"
      "rojo"
      "stylua"
      "selene"
      "roblox-ts"

      # JS Dev
      "node"
      "typescript"
      "typescript-language-server"

    ];
    casks = [

      #Primary
      "keepassxc"
      "discord"
      "librewolf"
      "steam"

      # Production
      "blender"
      "zed"

      # Minecraft
      "prismlauncher"
      "graalvm-jdk@21"

      # Extra
      "vial"
      "aerospace"
      "font-jetbrains-mono"

    ];
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    caskArgs = {
      no_quarantine = true;
    };

  };

}
