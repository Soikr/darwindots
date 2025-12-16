{
  lib,
  config,
  ...
}: {
  fileSystems."/boot" = {
    device = "/dev/disk/by-id/${config.diskID}-part1";
    fsType = "vfat";
    options = ["umask=0077"];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-id/${config.diskID}-part2";
      discardPolicy = "both";
    }
  ];

  fileSystems."/" = lib.mkForce {
    device = "zroot/local/root";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "zroot/local/nix";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/var/log" = {
    device = "zroot/local/var/log";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/var/lib" = {
    device = "zroot/local/var/lib";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/etc/config" = {
    device = "zroot/local/config";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/home" = {
    device = "zroot/local/home";
    type = "zfs";
    neededForBoot = true;
  };

  fileSystems."/virt" = {
    device = "zroot/local/virt";
    type = "zfs";
    neededForBoot = true;
  };
}
