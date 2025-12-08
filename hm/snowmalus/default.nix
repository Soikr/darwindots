{ user, ... }: {
  imports = [
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./programs/ghostty.nix
    ./programs/helix.nix
    ./utils.nix
  ];

  home = {
    username = user;
    homeDirectory = "/Users/${user}";

    file.".hushlogin".text = "";

    stateVersion = "25.11";
  };

  services.syncthing.enable = true;
}
