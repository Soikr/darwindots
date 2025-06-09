{config, ...}: let
  profiles = "${config.programs.appleblox.configDir}/profiles";
in {
  programs.appleblox = {
    enable = true;
    integrations = {
      enable = true;
      rpc = {
        enable = true;
        sdk = true;
        settings = {
          join = true;
          control = true;
        };
      };
    };
    behavior = {
      enable = true;
      launching = true;
      autoExit = true;
    };
    fflags = {
      enable = false;
      renderer = "vulkan";
      unlockFPS = true;
      disableVoxelShadows = true;
    };
    misc = {
      enable = true;
      fileLogs = false;
    };
    appearance = builtins.readFile ./lilac.css;
  };

  home.file = with builtins; {
    "${profiles}/nix.json" = let
      stuff = {
        name = "Nix";
        flags = [
          {
            flag = "FFlagUserHideCharacterParticlesInFirstPerson";
            value = true;
            enabled = true;
          }
          {
            flag = "DFIntDefaultTimeoutTimeMs";
            value = 5000;
            enabled = true;
          }
          {
            flag = "FIntFullscreenTitleBarTriggerDelayMillis";
            value = 3600000;
            enabled = true;
          }
        ];
        type = "default";
      };
    in {
      text = toJSON stuff;
    };
    "${profiles}/starscape.json" = {
      source = ./starscape.json;
    };
  };
}
