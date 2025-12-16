{
  description = "Nix MacOS configurations";

  outputs = {
    self,
    pkgs-darwin,
    pkgs-nixos,
    disko,
    nix-darwin,
    brew,
    hm,
  }: {
    darwinConfigurations."snowmalus" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self;};

      modules = [
        brew.darwinModules.nix-homebrew
        hm.darwinModules.home-manager

        ./hosts/snowmalus
      ];
    };
    nixosConfigurations."winterberry" = pkgs-nixos.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/winterberry
        disko.nixosModules.disko
      ];
    };
  };

  inputs = {
    pkgs-nixos.url = "github:NixOS/nixpkgs/nixos-25.11";
    pkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "pkgs-nixos";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "pkgs-darwin";
    };

    brew.url = "github:zhaofengli/nix-homebrew";

    hm = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "pkgs-darwin";
    };
  };
}
