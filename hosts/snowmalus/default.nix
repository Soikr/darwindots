{
  self,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/darwin
    ../../modules/shared
  ];

  users.users.soikr.home = "/Users/soikr";

  networking = {
    computerName = "snowmalus";
    hostName = "snowmalus";
    knownNetworkServices = ["Ethernet"];

    dns = [
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ];

    applicationFirewall = {
      enable = true;
      blockAllIncoming = true;
    };
  };

  nix = {
    enable = true;
    package = pkgs.lixPackageSets.stable.lix;
    channel.enable = false;
    daemonProcessType = "Adaptive";

    settings = {
      allowed-users = ["soikr"];
      trusted-users = ["soikr"];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://flakevim.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "flakevim.cachix.org-1:sSi7NLjf7/jLkn5QXQZ337+YqCQ2E1oJE1/SeaFQV3U="
      ];
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-darwin";
  };

  system = {
    primaryUser = "soikr";
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };
}
