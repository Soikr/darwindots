{...}: let
  clientAppSettings = "~/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json";
  robloxPath = "/Applications/Roblox.app/Contents/MacOS/ClientSettings";
in {
  launchd.user.agents.RobloxFFlags = {
    script = ''
      mkdir -p ${robloxPath}
      cp ${clientAppSettings} ${robloxPath}/ClientAppSettings.json
    '';
    serviceConfig.StartCalendarInterval = [
      {Weekday = 3;}
      {Weekday = 4;}
    ];
  };
}
