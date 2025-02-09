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
      enable = true;
      lod = true;
      gameDistance = {
        enable = true;
        games = [
          "8735521924"
          "2210085102"
        ];
      };
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
            flag = "FIntFullscreenTitleBarTriggerDelayMillis";
            value = 3600000;
            enabled = true;
          }
          {
            flag = "FFlagUserHideCharacterParticlesInFirstPerson";
            value = "True";
            enabled = true;
          }
          {
            flag = "DFIntCanHideGuiGroupId";
            value = "10685936";
            enabled = true;
          }
          {
            flag = "FIntRenderShadowIntensity";
            value = 0;
            enabled = true;
          }
          {
            flag = "FIntTerrainArraySliceSize";
            value = 8;
            enabled = true;
          }
          {
            flag = "FIntDebugForceMSAASamples";
            value = 0;
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
