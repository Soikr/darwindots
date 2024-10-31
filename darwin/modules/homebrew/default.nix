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

      # Discord
      "psharma04/dorion"

      # Pkgx
      "pkgxdev/made"

      # Personal
      "SoiKr/meowulae"
    ];

    casks = [
      # Primary
      #  "firefox"
      "zen-browser"
      "dorion"
      "obs"

      # Production
      "siyuan"
      "blender"
      "godot"
      "gimp"
      "obs"

      # Coding
      "vscodium"
      "rapidapi"

      # Reverse Engineering
      "ghidra"

      # Games
      "steam" # Must be on case-insensitive system btw

      ## Roblox
      "roblox"
      "robloxstudio"

      ## Minecraft
      "prismlauncher"
      "graalvm-jdk@21"
      "graalvm-jdk@17"
      "craftos-pc-accelerated"

      # Virtualization
      "utm"
      "docker" # docker desktop

      # Utilities
      "raycast"
      "keycastr"
      "the-unarchiver"
      "keepassxc"
      "vial"
      "ti-connect-ce"

      # System Management
      "aerospace"
      "macfuse"
    ];

    brews = [
      # Development
      "pkgxdev/made/pkgx"

      "rojo"

      # CTF
      "gdb"
      "radare2"
      "ophcrack"

      # Extra
      "openjdk@8"
    ];

    whalebrews = [
      "whalebrew/whalesay"
    ];

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };
  };
}
