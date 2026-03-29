{
  config,
  pkgs,
  ...
}: {
  environment = {
    gnome.excludePackages = with pkgs; [gnome-backgrounds gnome-tour gnome-user-docs];
    systemPackages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.caffeine

      gnome-tweaks
      nautilus
      file-roller
      papers
      pdfarranger
      loupe
      showtime
      gnome-text-editor
      gnome-calendar
    ];
  };

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = config.my.user;
      };
      gdm.enable = true;
    };
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;

      gnome-keyring.enable = true;
      gnome-software.enable = true;
    };
  };

  programs = {
    seahorse.enable = true;
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ptyxis";
    };
  };
}
