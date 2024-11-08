{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    # pkgs.sketchybar-app-font
  ];
}
