{config, ...}: {
  imports = [
    ./apps.nix
  ];

  nix-homebrew = {
    enable = true;
    user = config.my.user;
  };

  homebrew = {
    enable = true;

    global.autoUpdate = false;

    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };

    caskArgs.no_quarantine = true;
  };
}
