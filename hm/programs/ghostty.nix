{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "hybrid";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 13;

      macos-titlebar-style = "hidden";
      bell-features = "no-audio";
      macos-option-as-alt = true;
      quit-after-last-window-closed = true;
      clipboard-trim-trailing-spaces = true;
      cursor-style = "underline";

      window-padding-x = 15;
    };
  };
}
