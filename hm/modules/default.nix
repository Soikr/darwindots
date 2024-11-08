{
  #config,
  #pkgs,
  ...
}: {
  imports = [
    ./aerospace
    ./discord
    ./roblox
    ./btop.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];

  #xdg.configFile = import modules/sketchybar config pkgs;
}
