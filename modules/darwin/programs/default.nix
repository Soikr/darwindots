{
  imports = [
    ./sketchybar
    ./aerospace.nix
    ./zsh.nix
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
