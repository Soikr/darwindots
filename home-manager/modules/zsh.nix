{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = true;
      save = 1000;
      size = 1000;
    };

    shellAliases = {dr = "darwin-rebuild switch --flake";};

    prezto = {
      enable = true;
      caseSensitive = false;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      pmodules = [
        "autosuggestions"
        "command-not-found"
        "editor"
        "git"
        "syntax-highlighting"
        "terminal"
        "directory"
        "completion"
      ];
    };
  };
}
