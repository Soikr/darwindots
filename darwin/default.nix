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

  services.nix-daemon.enable = true;

  system = {
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
    localHostName = hostname;
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
      user = user;
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
      user = user;
    };
    settings = {
      allowed-users = [user];
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
      download-buffer-size = 134217728;
    };
  };
}
