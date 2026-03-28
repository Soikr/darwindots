{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "4G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "enc";
                passwordFile = "/tmp/secret.key";
                extraFormatArgs = [
                  "--iter-time=5000"
                  "--sector-size=4096"
                ];
                settings = {
                  allowDiscards = true;
                  bypassWorkqueues = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = ["-L" "nixos" "-f"];
                  subvolumes = let
                    fsOptions = [
                      "compress=zstd:1"
                      "noatime"
                      "commit=120"
                    ];
                  in {
                    "/root-blank" = {};
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = fsOptions;
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = fsOptions;
                    };
                    "/logs" = {
                      mountpoint = "/var/log";
                      mountOptions = fsOptions;
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = fsOptions;
                    };
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions = fsOptions;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
