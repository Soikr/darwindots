{
  # auto means the cask updates without brew.
  # I look for `auto_updates: true` in cask code.
  #
  # noauto means the cask only updates through brew.
  # I look for `auto_updates: false` in cask code.
  #
  # There is really no point in differentiating this.
  # But you know what apps will update from `brew update`.

  homebrew = {
    taps = [
      "pear-devs/pear"
    ];
    casks = [
      "zen" # auto
      "notion" # auto
      "monal" # noauto
      "signal" # auto
      "pear-desktop" # until pear-desktop on nix

      "steam" # auto
      "obs" # auto
      "onlyoffice" # auto
      "supertuxkart" # noauto

      "krita" # noauto
      "gimp" # noauto
      "godot" # noauto
      "roblox" # auto
      "robloxstudio" # auto

      "vial" # noauto
      "opencore-patcher" # auto
      "macfuse" # auto
      "sf-symbols" # auto
      "font-sf-mono" # noauto
      "pearcleaner" # auto
      "graalvm-jdk@21" # noauto
      "notunes" # noauto
      "xquartz" # auto, remove when nix fix
      "apple-hewlett-packard-printer-drivers" # noauto
    ];
  };
}
