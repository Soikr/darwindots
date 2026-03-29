{pkgs, ...}: {
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
    serviceConfig = {
      Type = "oneshot";
      Restart = "on-failure";
      RestartSec = "10s";
      StartLimitIntervalSec = "200s";
      StartLimitBurst = 20;
    };
  };
}
