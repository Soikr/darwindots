{...}: {
  launchd.user.agents.RobloxFFlags = {
    script = ''
      mkdir -p /Applications/Roblox.app/Contents/MacOS/ClientSettings
      cp ~/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json /Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json
    '';
    serviceConfig.RunAtLoad = true;
  };
}
