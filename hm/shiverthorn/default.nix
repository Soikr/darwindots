{user, ...}: {
  imports = [
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/zen_browser.nix
    ./utils.nix
  ];

  home = {
    username = user;

    file.".huslogin".text = "";
    stateVersion = "25.11";
  };

  services.syncthing.enable = true;
}
