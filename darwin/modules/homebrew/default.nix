{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = true;
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
      "obs"

      # Production
      "siyuan"
      "blender"
      "godot"
      "gimp"
      "android-studio"

      # Games
      "steam" # Must be on case-insensitive system btw

      "roblox"
      "robloxstudio"

      "prismlauncher"
      "graalvm-jdk@21"
      "graalvm-jdk@17"
      "craftos-pc-accelerated"

      # Utilities
      "raycast"
      "keycastr"
      "the-unarchiver"
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
