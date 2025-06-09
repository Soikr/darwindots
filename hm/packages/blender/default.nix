{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.blender;

  inherit
    (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    optional
    ;
in {
  options.programs.blender = with types; {
    enable = mkEnableOption "Enable Blender";
    package = mkOption {
      type = nullOr package;
      default = pkgs.callPackage ./blender.nix {};
      description = "Package for Blender, can be set to null or normal blender";
    };
  };

  config = mkIf cfg.enable {
    home.packages = optional (cfg.package != null) cfg.package;
  };
}
