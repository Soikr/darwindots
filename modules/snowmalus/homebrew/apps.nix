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
      "appleblox/homebrew-repo"
    ];
    casks = [
      "zen" # auto
      "notion" # auto
      "appleblox@dev" # noauto

      "steam" # auto
      "obs" # auto
      "onlyoffice" # auto
      "prismlauncher" # auto

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
    ];
  };
}
