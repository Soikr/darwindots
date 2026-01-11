{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      raycast
      jetbrains-toolbox
      utm
      anki-bin
      android-tools
      keepassxc
      youtube-music
      inkscape
      vesktop
      # prismlauncher

      imhex
      radare2
      ghidra-bin

      termshark
      tshark
      bruno
      httpie
      mitmproxy
      wget

      ffmpeg
      imagemagick
      sshfs
      comma
      gnupg
      jq
      ripgrep
      fd
      poetry
      rojo

      # xquartz
      keka
      pinentry_mac
      macfuse-stubs
    ];

    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      # Overrides
      cat = "bat";

      # Programs
      g = "git";
      po = "poetry";
      py = "python";

      # Nix
      dr = ''
        sudo darwin-rebuild switch  &&
        osascript -e 'display notification "Finished building!" with title "Nix System"'
      '';
      ngc = ''
        sudo nix-collect-garbage -d && nix store optimise &&
        osascript -e 'display notification "Cleaning completed!" with title "Nix System"'
      '';
      nv = ''
        nix store verify &&
        osascript -e 'display notification "Verification done!" with title "Nix System"'
      '';
      ns = "nix search nixpkgs";
    };

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
