{...}: {
  system = {
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
      universalaccess.reduceMotion = true;

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleScrollerPagingBehavior = true;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleTemperatureUnit = "Celsius";
        NSDocumentSaveNewDocumentsToCloud = false;
        NSWindowShouldDragOnGesture = true;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.0;
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
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        dashboard-in-overlay = true;
        expose-group-by-app = true; # For Aerospace
        # persistent-apps = [];
        show-recents = false;
        magnification = true;
        launchanim = false;
        mru-spaces = false;
        static-only = true;
        wvous-tl-corner = 2;
        wvous-tr-corner = 11;
        wvous-br-corner = 1; # Disable Quick Note
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        QuitMenuItem = true;
      };

      loginwindow = {
        DisableConsoleAccess = true;
        GuestEnabled = false;
      };

      menuExtraClock.Show24Hour = true;

      spaces.spans-displays = false; # Set true if using sketchybar
    };

    startup.chime = false;
  };
}
