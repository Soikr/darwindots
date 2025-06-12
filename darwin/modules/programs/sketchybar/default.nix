{pkgs, ...}: let
  sketchybarConfig = pkgs.callPackage ./config {};
  menus = pkgs.callPackage ./pkgs/menus {};

  lua = pkgs.lua54Packages.lua.withPackages (ps: [
    ps.lua
    pkgs.sbarlua
    sketchybarConfig
  ]);
in {
  services.sketchybar = {
    enable = true;

    extraPackages = [
      menus
    ];

    config = ''
      #!${lua}/bin/lua
        package.cpath = package.cpath .. ";${lua}/lib/?.so"
        require("init")
    '';
  };
}
