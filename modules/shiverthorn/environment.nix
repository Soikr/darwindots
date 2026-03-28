{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix
    git
    ptyxis
    keepassxc
    onlyoffice-desktopeditors
  ];
}
