{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./config.nix
    ./disko.nix
    ./sops.nix
    ./config.nix
    ./hardware-configuration.nix

    ../../modules/shiverthorn
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/${config.my.diskID}";

  boot = {
    supportedFilesystems = ["btrfs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.systemd = {
      enable = true;
      services.rollback = {
        description = "Rollback BTRFS root subvolume to pristine state";

        wantedBy = ["initrd.target"];
        after = ["systemd-cryptsetup@enc.service"];
        before = ["sysroot.mount"];

        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";

        script = ''
          mkdir -p /mnt

          mount -o subvol=/ /dev/mapper/enc /mnt

          btrfs subvolume list -o /mnt/root |
            cut -f9 -d' ' |
            while read subvolume; do
              echo "deleting /$subvolume subvolume..."
              btrfs subvolume delete "/mnt/$subvolume"
            done &&
            echo "deleting /root subvolume..." &&
            btrfs subvolume delete /mnt/root
          echo "restoring blank /root subvolume..."
          btrfs subvolume snapshot /mnt/root-blank /mnt/root

          umount /mnt
        '';
      };
    };
  };

  systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

  sops.secrets."shiverthorn/admin_passwd".neededForUsers = true;

  users = {
    mutableUsers = false;
    users."${config.my.user}" = {
      hashedPasswordFile = config.sops.secrets."shiverthorn/admin_passwd".path;
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.zsh;
    };
  };

  home-manager = {
    extraSpecialArgs = {user = config.my.user;};

    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [inputs.zen-browser.homeModules.beta];
    users.${config.my.user} = import ../../hm/shiverthorn;
  };

  networking.hostName = config.my.hostname;

  time.timeZone = lib.mkForce null;

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
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
