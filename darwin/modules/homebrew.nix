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
      #"zirixcz/vesktop/vesktop"
    ];
    taps = [];

  };

}
