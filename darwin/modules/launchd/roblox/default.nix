{...}: let
  clientAppSettings = ./clientAppSettings.json;
  robloxPath = "/Applications/Roblox.app/Contents/MacOS/ClientSettings";
in {
  launchd.agents.RobloxFFlags = {
    script = ''
      mkdir -p ${robloxPath}
      cp ${clientAppSettings} ${robloxPath}/ClientAppSettings.json
    '';
    serviceConfig = {
      StartCalendarInterval = [
        {Weekday = 3;}
        {Weekday = 4;}
      ];
    };
  };
}
