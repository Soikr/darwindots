{ self, config, pkgs, ... }: {
  imports = [
    ./config.nix

    ../../modules/snowmalus
  ];

  users.users."${config.my.user}" = {
    home = "/Users/${config.my.user}";
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { user = config.my.user; };
    
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.my.user} = import ../../hm/snowmalus;
  };

  networking = {
    computerName = config.my.hostname;
    hostName = config.my.hostname;
  };
  
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    channel.enable = false;
    settings = {
      allowed-users = [ config.my.user ];
      experimental-features = "nix-command flakes";
    };
  };
  
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-darwin";
  };

  system = {
    primaryUser = config.my.user; # Will be removed soon
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
  };
}
