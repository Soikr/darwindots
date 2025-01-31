{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.craftos;

  inherit
    (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    optional
    ;

  defaultPackage = pkgs.callPackage ./craftos.nix {accelerated = cfg.accelerated;};
in {
  options.programs.craftos = with types; {
    enable = mkEnableOption "Enable CraftOS";
    package = mkOption {
      type = nullOr package;
      default = defaultPackage;
      description = "Package for CraftOS, can be set to null";
    };
    accelerated = mkOption {
      type = bool;
      default = false;
      description = "Installs the accelerated variant";
    };
  };

  config = mkIf cfg.enable {
    home.packages = optional (cfg.package != null) cfg.package;
  };
}
