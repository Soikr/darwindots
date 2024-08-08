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

  programs = {zsh.enable = true;};

  services = {nix-daemon.enable = true;};

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [(nerdfonts.override {fonts = ["JetBrainsMono"];})];
  };

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        show-recents = false;
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
