{...}: {
  homebrew = {
    masApps = {
      Xcode = 497799835;
    };

    taps = [
      # Default
      "homebrew/bundle"
      "homebrew/services"

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
      "jetbrains-toolbox"
      "android-studio"
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
      "macfuse"

      # Stored
      # "firefox"
    ];

    brews = [
      # Development
      "rojo"

      # CTF
      "gdb"
      "radare2"

      # Extra
      "openjdk@8"
      "winetricks"
      "llvm"
      "mas"
      "swiftlint"
    ];
  };
}
