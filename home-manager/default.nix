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
    #./modules/firefox.nix
    #./modules/discord
    ./modules/roblox
    ./modules/fzf.nix
    ./modules/starship.nix
  ];

  #xdg.configFile = import modules/sketchybar config pkgs;

  nixpkgs.overlays = [inputs.meowvim.overlay];

  home = {
    packages = with pkgs; [
      #sketchybar
      syncthing

      # Production
      neovim

      # Net tools
      bind
      nmap
      termshark

      # Utilities
      wget
      openssl
      ffmpeg
      nmap
      comma
      fsrx
      httpie
      sshfs
      rclone
      silicon
      duf
      ugrep
      imhex

      # CTF
      hashcat
      john
      hashid

      # Languages
      python3

      # lua5_4 # 5_4 is required for sbarlua
      lua
      luau
      lua-language-server

      # deno # Doesnt build, probably will soon tho
      nodejs
      typescript
      nodePackages.npm
      nodePackages.yarn

      rustup

      ktlint
      kotlin

      golangci-lint

      # GNU Binaries
      coreutils-full
      gnutar
      gnused
      gnumake
      gzip
      gnugrep
      findutils
      gawk
    ];
  };

  programs = {
    home-manager.enable = true;

    starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        add_newline = false;
      };
    };

    jq.enable = true;
    bat.enable = true;
    zoxide.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    yt-dlp.enable = true;
    fd.enable = true;
    tealdeer.enable = true;

    gpg.enable = true;

    poetry.enable = true;
    gradle.enable = true;
    go = {
      enable = true;
      goPath = "go";
      goBin = ".local/go/bin";
    };
  };
}
