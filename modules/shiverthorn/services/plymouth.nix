{pkgs, ...}: {
  boot = {
    plymouth = {
      enable = true;
      theme = "blahaj";
      themePackages = [pkgs.plymouth-blahaj-theme];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };
}
