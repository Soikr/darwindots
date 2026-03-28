{pkgs, ...}: {
  environment = {
    gnome.excludePackages = with pkgs; [gnome-backgrounds gnome-tour gnome-user-docs];
    systemPackages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.caffeine
    ];
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;

      gnome-keyring.enable = true;
      gnome-software.enable = true;
    };
  };

  programs.seahorse.enable = true;
}
