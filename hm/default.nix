{
  imports = [
# ./programs/kitty.nix
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

    shell.enableFishIntegration = false;
  };

  services.syncthing.enable = true;
}
