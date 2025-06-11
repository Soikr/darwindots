{...}: {
  system = {
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };
      menuExtraClock.Show24Hour = true;
      spaces.spans-displays = false; # Set true if using sketchybar

      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleWindowTabbingMode = "always";
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
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.001;
        # _HIHideMenuBar = true; # Sketchybar
        "com.apple.keyboard.fnState" = true;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.springing.delay" = 0.35;
        "com.apple.swipescrolldirection" = false;
        "com.apple.sound.beep.volume" = 0.0;
        NSScrollAnimationEnabled = false;
      };

      LaunchServices.LSQuarantine = false;

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = false;
        EnableTilingByEdgeDrag = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        dashboard-in-overlay = true;
        expose-animation-duration = 0.0;
        expose-group-apps = true; # For Aerospace
        show-recents = false;
        mineffect = "scale";
        launchanim = false;
        mru-spaces = false;
        static-only = true;
        wvous-tl-corner = 11;
        wvous-tr-corner = 2;
        wvous-br-corner = 1; # Disable Quick Note
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        FXEnableExtensionChangeWarning = false;
        NewWindowTarget = "Home";
        ShowPathbar = true;
        _FXSortFoldersFirst = true;
        QuitMenuItem = true;
      };

      screencapture = {
        location = "~/Pictures/Captures";
        target = "clipboard";
        disable-shadow = true;
      };

      alf = {
        allowdownloadsignedenabled = 1;
        globalstate = 1;
      };

      loginwindow = {
        DisableConsoleAccess = true;
        GuestEnabled = false;
      };

      CustomSystemPreferences = {
        "com.apple.TextEdit".RichText = false;
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;

        # Prevent .DS_Store
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # Animations
        "com.apple.finder".DisableAllAnimations = true;

        NSGlobalDomain = {
          NSScrollViewRubberbanding = 0;
          QLPanelAnimationDuration = 0.0;
          NSToolbarFullScreenAnimationDuration = 0.0;
          NSBrowserColumnAnimationSpeedMultiplier = 0.0;
        };
        "com.apple.dock" = {
          springboard-show-duration = 0.0;
          springboard-hide-duration = 0.0;
          springboard-page-duration = 0.0;
        };

        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "64".enabled = false;
            "65".enabled = false;
          };
        };
      };
    };
    startup.chime = false;

    activationScripts.postActivation.text = ''
      mdutil -a -i off -d &> /dev/null
      mdutil -a -E &> /dev/null
    '';
  };
}
