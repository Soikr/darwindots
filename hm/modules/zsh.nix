{pkgs, ...}: {
  home.file.".hushlogin" = {
    enable = true;
    text = "";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = true;
      save = 2000;
      size = 2000;
    };

    initExtra = ''
      [ -f ~/.env/env.sh ] && source ~/.env/env.sh

      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/opt/homebrew/share

      bindkey '^e' edit-command-line
      bindkey '^f' fzf-file-widget

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

      function ls() {
        eza $*
      }

      function clone() { git clone git@$1.git }
      function gclone() { clone github.com:$1 }

      source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
      source "${pkgs.zsh-fzf-tab}/share/fzf-tab/lib/zsh-ls-colors/ls-colors.zsh"
      source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
      source "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"
    '';
    prezto = {
      enable = true;
      caseSensitive = false;
      utility.safeOps = true;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      pmodules = ["autosuggestions" "directory" "editor" "git" "terminal"];
    };
  };
}
