{pkgs, ...}: {
  imports = [
    ./services.nix
    ./environment.nix
  ];

  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;
}
