# https://wiki.nixos.org/wiki/Laptop
{lib, ...}: {
  services = {
    logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchExternalPower = "suspend";
    };

    # Disable GNOME power profiles
    power-profiles-daemon.enable = lib.mkForce false;

    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        # Lock clocks to lowest state on Battery
        RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
      };
    };
  };

  systemd.sleep.extraConfig = "HibernateDelaySec=30m";
}
