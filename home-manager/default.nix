{ pkgs, ... }: {

  imports = [
    ./modules/zsh.nix
    ./modules/git.nix
  ];

  home = {
    packages = with pkgs; [
      neovim
    ];

    sessionPath = [
      "$HOME/.local/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

  };

  programs = {
    home-manager.enable = true;

    starship = {
      enable = true;
    };

    go = {
      enable = true;
      goPath = "go";
      goBin = ".local/go/bin";
    };

  };

}
