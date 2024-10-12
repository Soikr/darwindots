{
  #config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/aerospace
    ./modules/firefox.nix
    ./modules/discord
    ./modules/roblox
  ];

  #xdg.configFile = import modules/sketchybar config pkgs;

  nixpkgs.overlays = [inputs.meowvim.overlay];

  home = {
    packages = with pkgs; [
      #sketchybar
      syncthing
      vscodium
      wireshark

      # Production
      neovim

      # Net tools
      bind
      nmap
      termshark

      # Utilities
      bat
      btop
      ripgrep
      delta
      wget
      fd
      openssl
      ffmpeg
      nmap
      comma
      eza
      yt-dlp
      gh

      # Languages
      python3
      poetry

      # lua5_4 # 5_4 is required for sbarlua
      lua
      luau
      lua-language-server

      # deno # doesnt work rn, a pr needs to be accepted
      nodejs
      typescript
      nodePackages.npm
      nodePackages.yarn

      rustup

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
