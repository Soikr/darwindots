{
  pkgs,
  lib,
  ...
}: {
  environment = {
    defaultPackages = lib.mkForce [];
    systemPackages = with pkgs; [
      jetbrains-toolbox
      anki
      keepassxc
      inkscape
      krita
      gimp
      onlyoffice-desktopeditors
      davinci-resolve
      blender-hip
      signal-desktop
      halloy
      prismlauncher
      superTuxKart
      ptyxis

      imhex
      radare2

      termshark
      tshark
      bruno
      httpie
      mitmproxy
      wget

      helix
      ffmpeg
      imagemagick
      sshfs
      comma
      gnupg
      jq
      ripgrep
      fd
      poetry
      uv
      rsync
    ];
    localBinInPath = true;
  };

  programs = {
    obs-studio.enable = true;
    steam.enable = true;
    thunderbird.enable = true;
    ghidra.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
