{pkgs, ...}: {
  imports = [
    ./modules/homebrew.nix
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  launchd.agents.FirefoxEnv = {
    serviceConfig.ProgramArguments = [
      "/bin/sh"
      "-c"
      "launchctl setenv MOZ_LEGACY_PROFILES 1; launchctl setenv MOZ_ALLOW_DOWNGRADE 1"
    ];
    serviceConfig.RunAtLoad = true;
  };

  programs = {zsh.enable = true;};

  services = {nix-daemon.enable = true;};

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["JetBrainsMono"];})];

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        show-recents = false;

	expose-group-by-app = true;
      };

      spaces = {
        spans-displays = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };

      NSGlobalDomain = {
        NSWindowShouldDragOnGesture = true;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        "com.apple.swipescrolldirection" = false;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.keyboard.fnState" = true;
      };
    };
  };
}
