{pkgs, ...}: {
  imports = [
    ./modules/system
    ./modules/homebrew
    ./modules/jankyborders
    ./modules/roblox
  ];

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-index-database.comma.enable = true;
  };

  launchd.agents = {
    FirefoxEnv = {
      serviceConfig.ProgramArguments = [
        "/bin/sh"
        "-c"
        "launchctl setenv MOZ_LEGACY_PROFILES 1; launchctl setenv MOZ_ALLOW_DOWNGRADE 1"
      ];
      serviceConfig.RunAtLoad = true;
    };
  };

  environment = {
    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      mkdir = "mkdir -p";
      del = "rm -rf";

      # Overrides
      cat = "bat";
      top = "btop";
      htop = "btop";
      pip = "python3 -m pip";
      venv = "python3 -m venv";

      # Programs
      g = "git";
      poe = "poetry";
      nr = "npm run";
      py = "python";

      # Nix
      dr = "darwin-rebuild switch --flake ~/.nixconf";
      ne = "nvim ~/.nixconf";
      nsh = "nix-shell";
      ns = "nix search nixpkgs";
      ngc = "nix-collect-garbage --delete-older-than +2 && nix-store --verify && nix store optimise";
    };

    shells = [pkgs.zsh];

    systemPath = [
      "$HOME/.local/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];

    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    # pkgs.sketchybar-app-font
  ];
}
