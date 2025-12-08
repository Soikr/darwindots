{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "hybrid";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 13;
      macos-icon = "blueprint";
      shell-integration-features = true;

      macos-titlebar-style = "hidden";
      bell-features = "no-audio";
      macos-option-as-alt = true;
      quit-after-last-window-closed = true;
      clipboard-trim-trailing-spaces = true;
      cursor-style = "underline";
      auto-update = "off";

      window-padding-x = 15;
    };
  };
}
