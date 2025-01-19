{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.appleblox;

  inherit
    (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    optional
    ;
in {
  options.programs.appleblox = with types; {
    enable = mkEnableOption "Enable The Roblox Manager, AppleBlox";
    package = mkOption {
      type = nullOr package;
      default = pkgs.callPackage ./appleblox.nix {};
      description = "Package for appleblox, can be set to null";
    };
    rootDir = mkOption {
      type = path;
      default = "${config.home.homeDirectory}/Library/Application Support/AppleBlox";
      readOnly = true;
    };
    configDir = mkOption {
      type = path;
      default = "${cfg.rootDir}/config";
      readOnly = true;
    };
    integrations = {
      enable = mkEnableOption "Management of integrations settings";
      location = mkEnableOption "Display server's location";
      rpc = {
        enable = mkEnableOption "Display game activity";
        sdk = mkEnableOption "SDK compatibility features";
        settings = {
          game = mkOption {
            type = bool;
            default = true;
            description = "Display current game";
          };
          time = mkOption {
            type = bool;
            default = true;
            description = "Time in game";
          };
          join = mkEnableOption "Add join button";
          control = mkEnableOption "Allow games to customize rpc";
        };
      };
    };
    behavior = {
      enable = mkEnableOption "Management of behavior settings";
      launching = mkEnableOption "Let AppleBlox control launching";
      returnWeb = mkEnableOption "Return to website after closing Roblox";
      autoExit = mkEnableOption "Close AppleBlox if Roblox is closed";
      desktop = mkOption {
        type = bool;
        default = true;
        description = "Desktop app";
      };
    };
    fflags = {
      enable = mkEnableOption "Management of fflags section";
      unlockFPS = mkEnableOption "FPS unlocker, forces Vulkan";
      renderer = mkOption {
        type = enum [
          "default"
          "metal"
          "vulkan"
          "opengl"
        ];
        default = "default";
        description = "Which renderer to use";
      };
      lighting = mkOption {
        type = enum [
          "default"
          "voxel"
          "shadowmap"
          "future"
        ];
        default = "default";
        description = "Lighting technologies";
      };
      voxelShadows = mkEnableOption "Shadows when using Voxel";
      globalDistance = mkEnableOption "Split graphics from render distance";
      quality = mkOption {
        type = listOf int;
        default = [5];
        description = "Base graphics value for games if globalDistance is enabled";
      };
      visuals = mkOption {
        type = bool;
        default = true;
        description = "Wheter or not to allow postfx";
      };
      lod = mkEnableOption "Reduce detail with distance";
      characterTextures = mkOption {
        type = bool;
        default = true;
        description = "Whether or not to enable player textures";
      };
      debugSky = mkEnableOption "Simple gray sky";
      menu = mkOption {
        type = enum [
          "default"
          "v2"
        ];
        default = "default";
        description = "What version of menu to use for Roblox";
      };
      gui = mkEnableOption "Keybinds for toggling UI";
      telemetry = mkEnableOption "Roblo analytical data";

      gameDistance = {
        enable = mkEnableOption "Set slider to distance per game";
        distance = mkOption {
          type = int;
          default = 1;
          description = "Graphics level per game";
        };
        games = mkOption {
          type = listOf str;
          default = [];
          description = "Games to apply distance slider";
        };
      };
    };
    appearance = mkOption {
      type = str;
      default = "";
      description = "CSS theming to AppleBlox";
    };
    misc = {
      enable = mkEnableOption "Management of misc section";
      sounds = mkEnableOption "Notification sounds";
      fileLogs = mkOption {
        type = bool;
        default = true;
        description = "Save console output into log files";
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = optional (cfg.package != null) cfg.package;

      file = with builtins; {
        "${cfg.configDir}/integrations.json" = let
          integrations = {
            activity = {
              notify_location = cfg.integrations.location;
            };
            sdk = {
              enabled = cfg.integrations.rpc.sdk;
              rpc = cfg.integrations.rpc.settings.control;
            };
            rpc = {
              enabled = cfg.integrations.rpc.enable;
              activity = cfg.integrations.rpc.settings.game;
              time = cfg.integrations.rpc.settings.time;
              joining = cfg.integrations.rpc.settings.join;
            };
          };
        in {
          enable = cfg.integrations.enable;
          text = toJSON integrations;
          force = true;
        };
        "${cfg.configDir}/roblox.json" = let
          behavior = {
            multi_instances = {
            };
            behavior = {
              delegate = cfg.behavior.launching;
              return_to_website = cfg.behavior.returnWeb;
              close_on_exit = cfg.behavior.autoExit;
              disable_desktop_app =
                if (cfg.behavior.desktop == true)
                then false
                else true;
            };
            launching = {
              delegate = false; # Not setup yet
            };
          };
        in {
          enable = cfg.behavior.enable;
          text = toJSON behavior;
          force = true;
        };
        "${cfg.configDir}/fastflags.json" = let
          fflags = {
            graphics = {
              unlock_fps = cfg.fflags.unlockFPS;
              engine = let
                labels = {
                  metal = "Metal";
                  vulkan = "Vulkan (MoltenVK)";
                  opengl = "OpenGL (Intel)";
                };
              in {
                label = labels.${cfg.fflags.renderer} or "Default";
                value = cfg.fflags.renderer;
              };
              lightning = let
                labels = {
                  voxel = "Voxel";
                  shadowmap = "ShadowMap";
                  future = "Future";
                };
              in {
                label = labels.${cfg.fflags.lighting} or "Default";
                value = cfg.fflags.lighting;
              };
              disable_voxel_shadows = cfg.fflags.voxelShadows;
              quality_distance_toggle = cfg.fflags.globalDistance;
              quality_distance = cfg.fflags.quality;
              postfx = cfg.fflags.visuals;
              lod = cfg.fflags.lod;
            };
            visual = {
              player_textures = cfg.fflags.characterTextures;
              debug_sky = cfg.fflags.debugSky;
            };
            ui = let
              labels.v2 = "Version 2 (2020)";
            in {
              menu_version = {
                label = labels.${cfg.fflags.menu} or "Default (Chrome)";
                value = cfg.fflags.menu;
              };
            };
            utility = {
              gui = cfg.fflags.gui;
              telemetry =
                if (cfg.fflags.telemetry == true)
                then false
                else true;
            };
            advanced = {
              ignore_flags_warning = true;
            };
          };
        in {
          enable = cfg.fflags.enable;
          text = toJSON fflags;
          force = true;
        };
        "${cfg.rootDir}/theme.css" = {
          enable = cfg.appearance != "";
          text = cfg.appearance;
          force = true;
        };
        "${cfg.configDir}/misc.json" = let
          misc = {
            advanced = {
              notify_all = cfg.misc.sounds;
              redirect_console = cfg.misc.fileLogs;
            };
          };
        in {
          enable = cfg.misc.enable;
          text = toJSON misc;
          force = true;
        };
        "${cfg.configDir}/profiles/distance.json" = let
          distance = {
            name = "Distance";
            flags = [
              {
                flag = "DFIntDebugFRMQualityLevelOverride";
                enabled = true;
                value = cfg.fflags.gameDistance.distance;
              }
            ];
            type = "game";
            games = [cfg.fflags.gameDistance.games];
          };
        in {
          enable = cfg.fflags.gameDistance.enable && cfg.fflags.gameDistance.games != [];
          text = toJSON distance;
          force = true;
        };
      };
    };
  };
}
