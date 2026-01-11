{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./disko.nix
    ./hardware-configuration.nix

    ../../modules/winterberry
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/${config.my.diskID}";

  boot = {
    supportedFilesystems = ["zfs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.systemd = {
      enable = true;
      services.initrd-rollback-root = {
        after = ["zfs-import-zroot.service"];
        wantedBy = ["initrd.target"];
        before = [
          "sysroot.mount"
        ];
        path = [pkgs.zfs];
        description = "Rollback root fs";
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = "zfs rollback -r zroot/local/root@blank";
      };
    };
  };

  users.users."${config.my.user}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "nixos";
  };

  networking = {
    hostName = config.my.hostname;
    hostId = "cafebabe";
    networkmanager.enable = true;
  };

  services.openssh.enable = true;
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
