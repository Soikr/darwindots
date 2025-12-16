{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./disko.nix
    ./hardware-configuration.nix
    ./filesystems.nix
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/${config.my.diskID}";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.postDeviceCommands = lib.mkAfter ''
      zfs rollback -r zroot/local/root@blank
    '';
  };

  users.users."${config.my.user}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  environment.systemPackages = with pkgs; [
    helix
    git
  ];

  networking = {
    hostName = config.my.hostname;
    hostId = "cafebabe";
    networkmanager.enable = true;
  };

  # services.openssh.enable
  # programs.gnupg.agent

  time.timeZone = "America/Los_Angeles";

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

  system.stateVersion = "25.11";
}
