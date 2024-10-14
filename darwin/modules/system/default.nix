{...}: {
  system = {
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleTemperatureUnit = "Celsius";
        NSDocumentSaveNewDocumentsToCloud = false;
        NSWindowShouldDragOnGesture = true;
        # _HIHideMenuBar = true; # Wait for sketchybar configuration
        "com.apple.keyboard.fnState" = true;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.springing.delay" = 0.35;
        "com.apple.swipescrolldirection" = false;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };

      dock = {
        autohide = true;
        expose-group-by-app = true; # For Aerospace
        # persistent-apps = [];
        show-recents = false;
        wvous-tl-corner = 2;
        wvous-tr-corner = 11;
        wvous-br-corner = 1; # Disable Quick Note
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        QuitMenuItem = true;
      };

      loginwindow = {
        DisableConsoleAccess = true;
        GuestEnabled = false;
      };

      menuExtraClock.Show24Hour = true;

      spaces.spans-displays = false;
    };

    startup.chime = false;
  };
}
