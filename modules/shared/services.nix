{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    tmux.enable = true;
    nix-index.enable = true;
  };
}
