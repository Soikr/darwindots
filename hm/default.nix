{
  imports = [
    ./programs/ghostty.nix
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./utils.nix
  ];

  home = {
    username = "soikr";
    homeDirectory = "/Users/soikr";

    stateVersion = "25.11";

    file.".hushlogin".text = "";
  };

  services.syncthing.enable = true;
}
