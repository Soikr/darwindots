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

      fpath+=${pkgs.nix-zsh-completions}/share/zsh/site-functions

      source "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh"
      source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh

      autoload -U compinit && compinit
    '';

    promptInit = ''
      source "${pkgs.spaceship-prompt}/lib/spaceship-prompt/spaceship.zsh"
    '';
  };
}
