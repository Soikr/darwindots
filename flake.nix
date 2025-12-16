{
  description = "Nix MacOS configurations";

  outputs = {
    self,
    pkgs-darwin,
    pkgs,
    darwin,
    brew,
    hm,
  }: {
    darwinConfigurations."snowmalus" = darwin.lib.darwinSystem {
      specialArgs = {inherit self;};

      modules = [
        brew.darwinModules.nix-homebrew
        hm.darwinModules.home-manager

        ./hosts/snowmalus
      ];
    };
    nixosConfigurations."winterberry" = pkgs.lib.nixosSystem {
      modules = [
        ./hosts/winterberry
      ];
    };
  };

  inputs = {
    pkgs = "github:NixOS/nixpkgs/nixos-unstable";
    pkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "pkgs";
    };

    brew.url = "github:zhaofengli/nix-homebrew";

    hm = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "pkgs-darwin";
    };
  };
}
