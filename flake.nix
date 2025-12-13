{
  description = "Nix MacOS configurations";

  outputs = {
    self,
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
      ];
    };
  };

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "pkgs";
    };

    brew.url = "github:zhaofengli/nix-homebrew";

    hm = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "pkgs";
    };
  };
}
