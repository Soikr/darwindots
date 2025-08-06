{pkgs, ...}: let
  sketchybarConfig = pkgs.callPackage ./config {};

  lua = pkgs.lua54Packages.lua.withPackages (ps: [
    ps.lua
    pkgs.sbarlua
    sketchybarConfig
  ]);
in {
  services.sketchybar = {
    enable = true;

    config = ''
      #!${lua}/bin/lua
        package.cpath = package.cpath .. ";${lua}/lib/?.so"
        require("init")
    '';
  };

  system.defaults = {
    spaces.spans-displays = true;
    NSGlobalDomain._HIHideMenuBar = true;
  };

  fonts.packages = with pkgs; [
    sketchybar-app-font
  ];
}
