# https://wiki.nixos.org/wiki/Laptop
{lib, ...}: {
  services = {
    # Disable GNOME power profiles
    power-profiles-daemon.enable = lib.mkForce false;

    thermald.enable = true;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
