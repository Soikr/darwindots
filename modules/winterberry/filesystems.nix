{lib, ...}: {
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
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/virt" = {
    device = "zroot/local/virt";
    fsType = "zfs";
    neededForBoot = true;
  };
}
