{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };

    taps = [
      # Default
      "homebrew/bundle"
      "homebrew/services"

      # Sketchybar
      "FelixKratz/formulae"

      # Aerosapce
      "nikitabobko/tap"

      # Personal
      "SoiKr/meowulae"
    ];

    casks = [
      # Primary
      "firefox"
      "vesktop"
      "obs"

      # Production
      "blender"
      "gimp"
      "kitty"
      "vscodium"
      "kdenlive"
      "siyuan"
      "wireshark"
      "godot"
      "jetbrains-toolbox"

      # Games
      "steam"

      "roblox"
      "robloxstudio"

      "prismlauncher"
      "graalvm-jdk@21"
      "graalvm-jdk@17"
      "craftos-pc-accelerated"

      # Utilities
      "utm"
      "keepassxc"
      "vial"

      # Fonts
      "font-jetbrains-mono"

      # System Management
      "aerospace"
      "macfuse"
    ];

    brews = [
      # System
      "sketchybar"
      "borders"
      "syncthing"

      # Utilities
      "sniffnet"

      # Development
      "rojo"

      # Extra
      "openjdk@8"
    ];

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };
  };
}
