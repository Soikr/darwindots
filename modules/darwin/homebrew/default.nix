{
  imports = [
    ./apps.nix
  ];

  nix-homebrew = {
    enable = true;
    user = "soikr";
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
