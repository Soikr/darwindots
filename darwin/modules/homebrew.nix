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
    
    brews = [];
    casks = [
      "keepassxc"
      "discord"
      "librewolf"
      "vial"
      "jetbrains-toolbox"
      "blender"
      "steam"
    ];
    taps = [];

  };

}
