{self, ...}: {
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
    channel.enable = false;
    daemonProcessType = "Adaptive";

    settings = {
      allowed-users = ["soikr"];
      trusted-users = ["soikr"];
    };
  };

  nixpkgs.hostPlatform = "x86_64-darwin";

  system = {
    primaryUser = "soikr";
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };
}
