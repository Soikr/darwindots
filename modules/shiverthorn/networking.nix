{pkgs, ...}: {
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        backend = "iwd";
      };
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    wireless.iwd.settings = {
      General.AddressRandomization = "network";
      Scan.DisablePeriodicScan = false;
    };
  };
}
