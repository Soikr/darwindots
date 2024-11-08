{pkgs, ...}: {
  environment = {
    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      mkdir = "mkdir -p";
      del = "rm -rf";

      # Overrides
      cat = "bat";
      top = "btop";
      htop = "btop";
      pip = "python3 -m pip";
      venv = "python3 -m venv";

      # Programs
      g = "git";
      poe = "poetry";
      nr = "npm run";
      py = "python";

      # Nix
      dr = "darwin-rebuild switch --flake ~/.nixconf";
      ne = "nvim ~/.nixconf";
      nsh = "nix-shell";
      ns = "nix search nixpkgs";
      ngc = "nix-collect-garbage -d && nix-store --gc && nix-store --verify && nix store optimise";
    };

    shells = [pkgs.zsh];

    systemPath = [
      "$HOME/.local/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];

    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
