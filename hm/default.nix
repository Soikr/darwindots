{
  pkgs,
  ...
}: {
  imports = [
    ./modules
    ./packages
  ];

  home = {
    packages = with pkgs; [
      # Production
      neovim
      # spacedrive # check pull 373271
      anki-bin

      # Net tools
      bind
      nmap
      termshark

      # Utilities
      wget
      openssl
      ffmpeg
      nmap
      fsrx
      httpie
      sshfs
      rclone
      silicon
      duf
      ugrep
      hashid
      packwiz

      ## Nix Tools
      cachix
      comma

      # Reverse Engineering
      imhex
      radare2

      # Languages

      ## Python
      python3

      ## Ruby
      ruby

      ## Lua
      lua5_4

      ## JS
      deno
      nodejs
      typescript
      nodePackages.npm
      nodePackages.yarn

      ## Rust
      rustup

      ## Kotlin
      kotlin

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

    # User made
    craftos = {
      enable = true;
      accelerated = true;
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
    go = {
      enable = true;
      goPath = "go";
      goBin = ".local/go/bin";
    };
  };
}
