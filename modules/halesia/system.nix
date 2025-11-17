{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 65;
  };
}
