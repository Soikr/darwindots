{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      anki-bin
      nmap
      netdiscover
      termshark
      ffmpeg
      httpie
      sshfs
      silicon
      duf
      comma
      imhex
      radare2
      ghidra-bin
      mitmproxy
      imagemagick
      gnupg
      wget
      jq
      ripgrep
      fd

      notion-app
      raycast
      jetbrains-toolbox
      android-tools
      bruno
      prismlauncher
      utm
      keepassxc
      keycastr
      macfuse-stubs
      xquartz
      pinentry_mac
      rojo
      transmission_4
      youtube-music
    ];

    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      # Overrides
      cat = "bat";
      top = "htop";

      # Programs
      g = "git";
      po = "poetry";
      py = "python";

      # Nix
      dr = ''
        sudo darwin-rebuild switch --flake ~/.nixconf &&
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
    };
  };
}
