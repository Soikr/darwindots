{ self, config, pkgs, ... }: {
  imports = [
    ./config.nix

    ../../modules/winterberry
  ];

  users.users."${config.my.user}" = {
    isNormalUser = true;i
    extraGroups = ["wheel"];
  };

  networking.hostName = config.my.hostname;
  
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    gc = {
      automatic = true;
      dates = "weekly";
    };
    optimise = {
      automatic = true;
      dates = "weekly";
    };
    channel.enable = false;
    settings = {
      allowed-users = [ config.my.user ];
      experimental-features = "nix-command flakes";
    };
  };
  
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  system.stateVersion = "25.11";
}
