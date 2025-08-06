{
  imports = [
    ./kitty.nix
    ./git.nix
    ./fastfetch.nix
  ];

  home = {
    username = "soikr";
    homeDirectory = "/Users/soikr";

    stateVersion = "25.11";

    file.".hushlogin".text = "";
  };

  programs = {
    bat = {
      enable = true;
      config = {
        style = "plain";
        theme = "zenburn";
      };
    };
    zoxide.enable = true;
    eza = {
      enable = true;
      icons = "auto";
      extraOptions = ["--group-directories-first"];
    };
    tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };
    yt-dlp = {
      enable = true;
      extraConfig = "--quiet";
      settings = {
        embed-thumbnail = true;
        output = "~/Movies/YouTube/%(title)s.%(ext)s";
      };
    };
    fzf.enable = true;
  };

  services.syncthing.enable = true;
}
