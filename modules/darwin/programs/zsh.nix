{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableFastSyntaxHighlighting = true;
    enableFzfCompletion = true;

    interactiveShellInit = ''
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

      source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
    '';

    promptInit = ''
      source "${pkgs.spaceship-prompt}/lib/spaceship-prompt/spaceship.zsh"
    '';
  };
}
