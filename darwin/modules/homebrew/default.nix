{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = true;
    };

    masApps = {
      Xcode = 497799835;
    };

    taps = [
      # Default
      "homebrew/bundle"
      "homebrew/services"

      # Aerosapce
      "nikitabobko/tap"

      # Pkgx
      "pkgxdev/made"

      # Personal
      "SoiKr/meowulae"
    ];

    casks = [
      # Primary
      "zen-browser"
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

      # Virtualization/Not Emulation
      "utm"
      "docker" # docker desktop
      "wine@staging"

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

      # Stored
      # "firefox"
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
      "winetricks"
      "llvm"
      "mas"
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
