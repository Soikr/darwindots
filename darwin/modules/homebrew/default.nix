{
  user,
  inputs,
  config,
  ...
}: {
  imports = [./apps.nix];

  nix-homebrew = {
    enable = true;
    user = user;

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-services" = inputs.homebrew-services;
      "soikr/homebrew-meowulae" = inputs.homebrew-meowulae;
    };

    mutableTaps = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
