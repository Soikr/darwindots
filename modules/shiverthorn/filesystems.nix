{
  config,
  lib,
  pkgs,
  ...
}: {
  preservation = {
    enable = true;
    preserveAt."/persist" = {
      directories = [
        "/etc/NetworkManager/system-connections"
        {
          directory = "/var/lib/nixos";
          inInitrd = true;
        }
        "/var/lib/flatpak"
        "/var/lib/NetworkManager"
        "/var/lib/iwd"
        "/var/lib/geoclue"
      ];
      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_rsa_key.pub";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_rsa_key";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key.pub";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/var/lib/systemd/random-seed";
          how = "symlink";
          inInitrd = true;
          configureParent = true;
        }
      ];
    };
  };

  fileSystems = {
    "/persist".neededForBoot = true;
    "/var/log".neededForBoot = true;
  };

  systemd.services.persist-timezone = lib.mkIf (config.time.timeZone == null) {
    description = "Persist /etc/localtime";
    wantedBy = ["sysinit.target"];
    before = ["systemd-timedated.service"];
    unitConfig.RequiresMountsFor = "/persist";

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "-${pkgs.coreutils}/bin/cp --no-dereference /persist/etc/localtime /etc/localtime";
      ExecStop = [
        "-${pkgs.coreutils}/bin/mkdir -p /persist/etc"
        "-${pkgs.coreutils}/bin/cp --no-dereference /etc/localtime /persist/etc/localtime"
      ];
    };
  };
}
