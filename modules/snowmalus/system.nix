{
  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-time-modifier = 0.0;
        autohide-delay = 0.0;
        show-recents = false;
        static-only = true;
        mru-spaces = false;
        launchanim = false;
        wvous-tl-corner = 11;
        wvous-tr-corner = 2;
        wvous-br-corner = 1; # Disable Quick Note
      };

      screencapture.disable-shadow = true;

      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        # "com.apple.mouse.linear" = true;
        ApplePressAndHoldEnabled = false;
        AppleKeyboardUIMode = 2;
        AppleWindowTabbingMode = "manual";
        AppleICUForce24HourTime = true;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleScrollerPagingBehavior = true;
        NSWindowShouldDragOnGesture = true;
        NSAutomaticWindowAnimationsEnabled = false;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.swipescrolldirection" = false;
        NSScrollAnimationEnabled = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        FXPreferredViewStyle = "Nlsv";
        _FXSortFoldersFirst = true;
        # FinderSpawnTab = false;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        CreateDesktop = false;
        NewWindowTarget = "Home";
      };

      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        EnableTilingByEdgeDrag = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };

      LaunchServices.LSQuarantine = false;

      loginwindow = {
        DisableConsoleAccess = true;
        GuestEnabled = false;
      };

      CustomSystemPreferences = {
        "com.apple.appleseed.FeedbackAssistant".Autogather = false;
        "com.apple.dt.Xcode".ShowBuildOperationDuration = true;
        "com.apple.TextEdit".RichText = false;
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        universalaccess.showWindowTitlebarIcons = true;

        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        NSGlobalDomain = {
          NSScrollViewRubberbanding = 0;
          QLPanelAnimationDuration = 0.0;
          NSToolbarFullScreenAnimationDuration = 0.0;
          NSBrowserColumnAnimationSpeedMultiplier = 0.0;
        };

        "com.apple.finder".DisableAllAnimations = true;
      };
    };
    startup.chime = false;
  
    activationScripts.postActivation.text = ''
      mdutil -a -i off -d &> /dev/null
      mdutil -a -E &> /dev/null
    '';
  };
}
