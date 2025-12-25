{
  description = "Nix MacOS configurations";

  outputs = {
    self,
    nixpkgs-darwin,
    nixpkgs-nixos,
    nix-darwin,
    nix-homebrew,
    home-manager,
    disko,
    sops-nix,
  }: {
    darwinConfigurations."snowmalus" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self;};

      modules = [
        nix-homebrew.darwinModules.nix-homebrew
        home-manager.darwinModules.home-manager

        ./hosts/snowmalus
      ];
    };
    nixosConfigurations."winterberry" = nixpkgs-nixos.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops

        ./hosts/winterberry
      ];
    };
  };

  inputs = {
    nixpkgs-nixos.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs-nixos";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs-nixos";
    };
  };
}
