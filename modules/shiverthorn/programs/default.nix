{
  imports = [];

  programs = {
    zsh.enable = true;

    obs-studio.enable = true;

    steam = {
      enable = true;
      protontricks.enable = true;
    };

    thunderbird.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    ghidra.enable = true;
  };
}
