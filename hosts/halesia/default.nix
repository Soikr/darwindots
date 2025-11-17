{
  pkgs,
  self,
  ...
}: {
  imports = [
    ../../modules/halesia
  ];

  networking = {
    hostName = "halesia";
    hostId = "9b85b9cb";

    useNetworkd = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };

  nix = {
    enable = true;
    package = pkgs.lixPackageSets.stable.lix;
    channel.enable = false;

    gc = {
      automatic = true;
      options = "--delete-older-than 12d";
    };
    optimise.automatic = true;

    settings = {
      allowed-users = ["silverbell"];

      substituters = [
        "https://nix-community.cachix.org"
        "https://microvm.cachix.org"
        "https://flakevim.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
        "flakevim.cachix.org-1:sSi7NLjf7/jLkn5QXQZ337+YqCQ2E1oJE1/SeaFQV3U="
      ];
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  system.stateVersion = "25.11";
}
