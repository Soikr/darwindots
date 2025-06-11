{pkgs, ...}: {
  fonts.packages = with pkgs; [
    sketchybar-app-font
    nerd-fonts.jetbrains-mono
  ];
}
