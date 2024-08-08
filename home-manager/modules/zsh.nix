{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = false;
    autocd = true;
    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = true;
      save = 1000;
      size = 1000;
    };

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -al";

      # Nix
      dr = "darwin-rebuild switch --flake ~/.nixconf";
      ne = "nvim -c ':cd ~/.nixpkgs' ~/.nixconf";
      nsh = "nix-shell";
      ns = "nix search nixpkgs";
      ngc = "nix-collect-garbage -d && nix-store --gc && nix-store --verify --check-contents && nix store optimise";
    };

    plugins = [
      {
        name = "nix-zsh-shell";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "nix-zsh-completions";
        src = "${pkgs.nix-zsh-completions}/share/zsh/site-functions";
      }
      {
        name = "zsh-fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];
  };
}
