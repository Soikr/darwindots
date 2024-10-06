{
  inputs,
  pkgs,
  ...
}: {
  home.file."Library/Application Support/Firefox/Profiles/Nixfox/chrome/Neptune".source = inputs.NeptuneFox;
  home.sessionVariables.MOZ_LEGACY_PROFILES = 1;

  programs.firefox = {
    enable = true;
    package = null;

    arkenfox = {
      enable = true;
    };

    profiles.Nixfox = {
      isDefault = true;
      name = "Nixfox";

      search = {
        default = "DuckDuckGo";
        force = true;
      };

      userChrome = ''
        @import "Neptune/chrome/userChrome.css";
      '';

      userContent = ''
        @import "Neptune/chrome/userContent.css";
      '';

      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        keepassxc-browser
        darkreader
        adaptive-tab-bar-colour
      ];

      settings = {
        "extensions.pocket.enabled" = false;
        "startup.homepage_welcome_url" = "";
        "startup.homepage_override_url" = "";
        "browser.shell.checkDefaultBrowser" = false;
        "identity.fxaccounts.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.system.topstories" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = true;
        "browser.newtabpage.activity-stream.newtabWallpapers.v2.enabled" = true;
      };

      arkenfox = {
        enable = true;
        enableAllSections = true;
        "0700" = {
          "0710"."network.trr.mode".enable = true;
          "0712" = {
            "network.trr.uri".enable = true;
            "network.trr.uri".value = "https://dns.quad9.net/dns-query";
            "network.trr.custom_uri".enable = true;
            "network.trr.custom_uri".value = "https://dns.quad9.net/dns-query";
          };
        };
        "0800" = {
          "0802" = {
            "browser.urlbar.quicksuggest.enabled".enable = true;
            "browser.urlbar.suggest.quicksuggest.nonsponsored".enable = true;
            "browser.urlbar.suggest.quicksuggest.sponsored".enable = true;
          };
          "0803" = {
            "browser.search.suggest.enabled".value = true;
            "browser.urlbar.suggest.searches".value = true;
          };
        };
        "1600"."1602"."network.http.referer.XOriginTrimmingPolicy".enable = false;
	"4500" = {
	  "4504"."privacy.resistFingerprinting.letterboxing".enable = false;
	  "4520"."webgl.disabled".enable = false;
	};
        "5000" = {
          "5003"."signon.rememberSignons".enable = true;
          "5008"."browser.sessionstore.resume_from_crash".enable = true;
          "5016"."browser.download.folderList".enable = true;
          "5017" = {
            "extensions.formautofill.addresses.enabled".enable = true;
            "extensions.formautofill.creditCards.enabled".enable = true;
          };
        };
        "5500" = {
          "5508"."media.eme.enabled".value = false;
        };
      };
    };
  };
}
