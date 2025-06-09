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
      dr = "sudo darwin-rebuild switch --flake ~/.nixconf";
      nim = "nvim ~/.nixconf";
      nsh = "nix-shell";
      nsearch = "nix search nixpkgs";
      ngc = "sudo nix-collect-garbage -d && nix store optimise";
      nv = "nix store verify";
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
