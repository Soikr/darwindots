{
  imports = [
    ./services.nix
    ./environment.nix
  ];

  nix = {
    channel.enable = false;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;
}
