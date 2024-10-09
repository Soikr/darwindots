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

      # Aerosapce
      "nikitabobko/tap"

      # Personal
      "SoiKr/meowulae"
    ];

    casks = [
      # Primary
      "firefox"
      "zen-browser" # Trying this out
      "vesktop"
      "obs"

      # Production
      "siyuan"
      "blender"
      "godot"
      "gimp"

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

      # System Management
      "aerospace"
      "macfuse"
    ];

    brews = [
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
