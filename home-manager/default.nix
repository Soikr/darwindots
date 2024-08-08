{pkgs, ...}: {
  imports = [
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/aerospace
    ./modules/jankyborders
    ./modules/firefox
    ./modules/vesktop
    ./modules/roblox
  ];

  home = {
    packages = with pkgs; [
      # Productioj
      neovim
      termshark

      # Utilities
      ripgrep
      wget
      fd
      openssl
      ffmpeg
      nmap
      comma

      # Languages
      python3

      lua
      luau
      lua-language-server

      rustup

      deno
      nodejs
      typescript
      nodePackages.npm
      nodePackages.yarn

      ktlint
      kotlin
      gradle

      golangci-lint

      # GNU Binaries
      coreutils-full
      gnupg
      gnutar
      gnused
      gnugrep
      gnumake
      gzip
      findutils
      gawk
    ];

    sessionPath = ["$HOME/.local/go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin"];

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    starship = {enable = true;};

    go = {
      enable = true;
      goPath = "go";
      goBin = ".local/go/bin";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor --exclude node_modules";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
      ];
    };
  };
}
