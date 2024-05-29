{ ... }: {

  homebrew = {
    enable = true;

    global = {
      brewfile = true;
    };

    onActivation = {
      cleanup = "zap";
    };

    masApps = {};
    
    brews = [
      "sketchybar"
    ];
    casks = [
      "keepassxc"
      "discord"
      "librewolf"
      "vial"
      "blender"
      "steam"
      "aerospace"
      "vscodium"
      "jetbrains-toolbox"
    ];
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    caskArgs = {
      no_quarantine = true;
    };

  };

}
