{lib, ...}: {
  imports = [
    ./sketchybar
    ./aerospace.nix
    ./zsh.nix
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.tailscale.enable = true;
}
