# https://wiki.nixos.org/wiki/Firefox
# https://github.com/0xc000022070/zen-browser-flake
{
  lib,
  pkgs,
  ...
}: {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFeedbackCommands = true;
      SanitizeOnShutdown = true;
      HttpsOnlyMode = "enabled";
      EnableTrackingProtection = {
        Value = true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
      };

      # Keepass
      OfferToSaveLogins = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      DisablePocket = true;
      GenerativeAI.Enabled = false;
      NoDefaultBookmarks = true;

      # Managed by Home Manager
      DisableAppUpdate = true;
      DontCheckDefaultBrowser = true;

      PromptForDownloadLocation = true;
      Homepage.StartPage = "none";

      Preferences = {
        "browser.tabs.warnOnClose" = {
          Value = false;
          Status = "default";
        };

        "general.autoScroll" = {
          Value = true;
          Status = "default";
        };
        "general.smoothScroll" = {
          Value = false;
          Status = "default";
        };

        # GPU only supports h.264 hardware acceleration
        "media.mediasource.vp9.enabled" = {
          Value = false;
          Status = "default";
        };
        "media.av1.enabled" = {
          Value = false;
          Status = "default";
        };
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "menupanel";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "menupanel";
        };
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "menupanel";
        };
        "deArrow@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dearrow/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "menupanel";
        };
        "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/violentmonkey/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "menupanel";
        };
      };

      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = rec {
            uiTheme = "dark";
            uiAccentCustom = true;
            uiAccentCustom0 = "#f7cfec";
            cloudStorageEnabled = lib.mkForce false;
            advancedUserEnabled = true;

            importedLists = [
              "https://raw.githubusercontent.com/yokoffing/filterlists/refs/heads/main/privacy_essentials.txt"
              "https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/adblock/pro.mini.txt"
              "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
              "https://raw.githubusercontent.com/DandelionSprout/adfilt/refs/heads/master/BrowseWebsitesWithoutLoggingIn.txt"
              "https://raw.githubusercontent.com/yokoffing/filterlists/refs/heads/main/youtube_clear_view.txt"
              "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
            ];

            externalLists = lib.concatStringsSep "\n" importedLists;
            popupPanelSections = 31;
          };

          selectedFilterLists = [
            # My filters
            "user-filters"

            # Built-in
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"

            # Ads
            "easylist"

            # Privacy
            "easyprivacy"
            "adguard-spyware-url"

            # Malware/Security
            "urlhause-1"

            # Multipurpose
            "plowe-0"

            # Cookie notices
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"

            # Annoyances
            "fanboy-ai-suggestions"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "ublock-annoyances"

            # Custom
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/refs/heads/master/BrowseWebsitesWithoutLoggingIn.txt"
            "https://raw.githubusercontent.com/yokoffing/filterlists/refs/heads/main/privacy_essentials.txt"
            "https://raw.githubusercontent.com/yokoffing/filterlists/refs/heads/main/youtube_clear_view.txt"
            "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
            "https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/adblock/pro.mini.txt"
          ];
        };
      };
    };
  };
}
