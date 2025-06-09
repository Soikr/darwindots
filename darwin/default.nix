{
  pkgs,
  self,
  overlays,
  user,
  hostname,
  ...
}: {
  imports = [./modules];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = false;
    };
    overlays = overlays;
  };

  system = {
    primaryUser = "${user}";

    stateVersion = 5;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  networking = {
    computerName = hostname;
    hostName = hostname;
    knownNetworkServices = ["Ethernet"];
    dns = [
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ];
  };

  nix = {
    package = pkgs.nixVersions.git;
    gc = {
      automatic = true;
      options = "--delete-older-than 12d";
      interval = [
        {
          Hour = 9;
          Minute = 30;
          Weekday = 2;
        }
      ];
    };
    optimise = {
      automatic = false;
      interval = [
        {
          Hour = 9;
          Minute = 30;
          Weekday = 3;
        }
      ];
    };
    settings = {
      allowed-users = [user];
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
      download-buffer-size = 268435456;
    };
  };
}
