config: pkgs: let
  sketchybar.template = pkgs.substituteAllFiles {
    src = ./sketchybar;
    files = [
      "sketchybarrc"
      "items/apple.lua"
      "items/menus.lua"
      "items/widgets/wifi.lua"
    ];
    lua = "${pkgs.lua5_4}/bin/lua";
    sketchybar_lua_so = pkgs.callPackage ./packages/sbarlua.nix {};
    bridges = pkgs.callPackage ./packages/bridge {};
  };

  sketchybar.rc = pkgs.runCommand "sketchybar-rc" {} ''
    mkdir -p "$out"
    cp ${sketchybar.template}/sketchybarrc "$out"
    chmod +x "$out/sketchybarrc"
  '';
in {
  "sketchybar".source = pkgs.symlinkJoin {
    name = "sketchybar";
    paths = with sketchybar; [rc template ./sketchybar];
  };
}
