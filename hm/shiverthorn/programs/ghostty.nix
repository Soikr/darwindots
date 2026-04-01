{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Hybrid";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 11;
      shell-integration-features = true;

      bell-features = "no-audio";
      clipboard-trim-trailing-spaces = true;
      cursor-style = "underline";

      window-padding-x = 15;
    };
  };
}
