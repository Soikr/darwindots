{...}: {
  imports = [./apps.nix];

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = true;
    };

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };
  };
}
