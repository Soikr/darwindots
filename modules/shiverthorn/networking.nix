{
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        backend = "iwd";
      };
    };
    wireless.iwd.settings = {
      General.AddressRandomization = "network";
      Scan.DisablePeriodicScan = false;
    };
  };
}
