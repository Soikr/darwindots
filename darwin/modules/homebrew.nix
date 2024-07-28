{...}: {
  homebrew = {
    enable = true;

    onActivation = {cleanup = "zap";};

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

      # Production
      "blender"
      "gimp"
      "kitty"
      "vscodium"
      "jetbrains-toolbox"

      # Games
      "steam"

      "prismlauncher"
      "graalvm-jdk@21"
      "graalvm-jdk@17"

      # Utilities
      "keepassxc"
      "vial"

      # Fonts
      "font-jetbrains-mono"

      # System Management
      "aerospace"
    ];

    brews = [
      # System
      "sketchybar"
      "borders"

      # Development
      "lua"
      "rojo"

      "node"
      "typescript"

      "rustup-init"
    ];

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };
  };
}
