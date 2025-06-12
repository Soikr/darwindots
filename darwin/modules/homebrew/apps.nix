{...}: {
  homebrew = {
    casks = [
      # Primary
      "zen"
      "notion"
      "discord"
      "signal"
      "youtube-music"

      ## Production
      "kdenlive"
      "godot"
      "gimp"
      "obs"

      ## Coding
      "jetbrains-toolbox"
      "vscodium"
      "android-studio"
      "android-platform-tools"
      "rapidapi"

      ## Reverse Engineering
      "ghidra"

      # Games
      "steam" # Must be on case-insensitive fs

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
      "syncthing" # Includes tray
      "keycastr"
      "vial"
      "protonvpn"
      "parsec"
      "pearcleaner"
      "ti-connect-ce"

      ## System
      "raycast"
      "the-unarchiver"
      "macfuse"
      "xquartz"
      "sf-symbols"
    ];

    brews = [
      # Primary
      "mabel"

      # Development
      "react-native-cli"
      "pinentry"

      # Roblox
      "rojo"
      "stylua"
      "selene"

      ## LSP/Linter
      "swiftlint"

      # System
      "mas"

      # Extra
      "openjdk@8"
    ];
  };
}
