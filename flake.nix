{
  description = "Nix MacOS configurations";

  outputs = inputs @ {
    self,
    nixpkgs,
    darwinpkgs,
    darwin,
    brew,
    hm,
    disko,
    sops,
    ...
  }: {
    darwinConfigurations."snowmalus" = darwin.lib.darwinSystem {
      specialArgs = {inherit self;};

      modules = [
        brew.darwinModules.nix-homebrew
        hm.darwinModules.home-manager

        ./hosts/snowmalus
      ];
    };
    nixosConfigurations."winterberry" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs;};
      modules = [
        disko.nixosModules.disko
        sops.nixosModules.sops
        hm.nixosModules.home-manager

        ./hosts/winterberry
      ];
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    darwinpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "darwinpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    brew.url = "github:zhaofengli/nix-homebrew";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/Soikr/nix-secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };
}
