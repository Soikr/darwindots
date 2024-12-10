{...}: {
  homebrew = {
    masApps = {
      Xcode = 497799835;
    };

    casks = [
      # Primary
      "zen-browser"
      "siyuan"

      ## Production
      "blender"
      "godot"
      "gimp"
      "obs"

      ## Coding
      "jetbrains-toolbox"
      "vscodium"
      "android-studio"
      "rapidapi"

      ## Reverse Engineering
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

      # Virtualization
      "utm"
      "docker"

      # Utilities
      "keepassxc"
      "keycastr"
      "vial"
      "parsec"
      "balenaetcher"
      "ti-connect-ce"

      ## System
      "raycast"
      "the-unarchiver"
      "macfuse"
    ];

    brews = [
      "mabel"

      # Development
      "react-native-cli"
      "watchman"
      "cocoapods"
      "rojo"
      "pinentry"

      ## LSP/Linter
      "swiftlint"

      # System
      "mas"

      # Extra
      "openjdk@8"
    ];
  };
}
