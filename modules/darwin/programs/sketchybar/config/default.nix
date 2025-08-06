{
  lua54Packages,
  pkgs,
  lib,
  ...
}: let
  inherit (lua54Packages) lua buildLuaPackage;
in
  buildLuaPackage {
    name = "sketchybar-config";
    pname = "sketchybar-config";
    version = "0.0.0";
    src = lib.cleanSource ./.;
    buildPhase = ":";
    installPhase = ''
      mkdir -p "$out/share/lua/${lua.luaversion}"
      cp -r $src/* "$out/share/lua/${lua.luaversion}/"
      cp ${pkgs.sketchybar-app-font}/lib/sketchybar-app-font/icon_map.lua "$out/share/lua/${lua.luaversion}"
    '';
  }
