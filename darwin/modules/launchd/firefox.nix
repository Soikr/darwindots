{...}: {
  launchd.agents = {
    FirefoxEnv = {
      serviceConfig.ProgramArguments = [
        "/bin/sh"
        "-c"
        "launchctl setenv MOZ_LEGACY_PROFILES 1; launchctl setenv MOZ_ALLOW_DOWNGRADE 1"
      ];
      serviceConfig.RunAtLoad = true;
    };
  };
}
