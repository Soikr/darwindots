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

      "th-ch/homebrew-youtube-music" = inputs.homebrew-ytm;
    };

    mutableTaps = false;
  };

  homebrew = {
    enable = true;

    global.autoUpdate = false;

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = true;
    };

    caskArgs.no_quarantine = true;

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
