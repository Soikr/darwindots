{
  inputs,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.flakevim.packages.${pkgs.stdenv.system}.default
    ];

    shellAliases = {
      mkdir = "mkdir -p";
      del = "rm -rf";

      nim = "vim ~/.nixconf";
      nsearch = "nix search nixpkgs";
    };

    variables = {
      EDITOR = "helix";
      VISUAL = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
