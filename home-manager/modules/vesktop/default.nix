{...}: {
  home.file."Library/Application Support/vesktop/settings/settings.json".source = ./settings.json;
  home.file.vesktop = {
    target = "Library/Application Support/vesktop/settings.json";
    text = ''
      {
        "minimizeToTray": "on",
        "discordBranch": "stable",
        "arRPC": "on",
        "splashColor": "rgb(220, 221, 222)",
        "splashBackground": "rgb(17, 17, 17)",
        "spellCheckLanguages": [
            "en-US"
        ],
        "customTitleBar": false,
        "splashTheming": true,
        "disableSmoothScroll": false,
        "disableMinSize": true,
        "clickTrayToShowHide": false
      }
    '';
  };
}
