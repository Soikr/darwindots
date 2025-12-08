{
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
    fzf.enable = true;
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
  };
}
