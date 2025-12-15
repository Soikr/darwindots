{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./disko.nix
    ./config.nix

    ../../modules/winterberry
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/ata-WDC_WD10EZEX-75WN4A0_WD-WCC6Y7LYP330";

  users.users."${config.my.user}" = {
    isNormalUser = true;
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
      allowed-users = [config.my.user];
      experimental-features = "nix-command flakes";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.11";
}
