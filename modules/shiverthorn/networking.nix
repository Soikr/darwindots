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
      Network.EnableIPv6 = true;
      General.AddressRandomization = "network";
      Settings.AutoConnect = true;
    };
  };
}
