{
  lib,
  pkgs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      autocd = true;

      initContent = let
        zshConfig = lib.mkOrder 1000 ''
          bindkey "\e[H" beginning-of-line
          bindkey "\e[F" end-of-line

          function cd() {
            builtin cd $*
            eza
          }

          function mkd() {
            mkdir $1
            builtin cd $1
          }
        '';

        zshPrompt = lib.mkOrder 1500 ''
          source "${pkgs.spaceship-prompt}/lib/spaceship-prompt/spaceship.zsh"
        '';
      in
        lib.mkMerge [zshConfig zshPrompt];

      plugins = [
        {
          name = "fast-syntax-highlighting";
          src = pkgs.zsh-fast-syntax-highlighting;
          file = "share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh";
        }
        {
          name = "nix-zsh-completions";
          src = pkgs.nix-zsh-completions;
          file = "share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh";
          completions = ["share/zsh/site-functions"];
        }
        {
          name = "nix-shell";
          src = pkgs.zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
      ];
    };
  };
}
