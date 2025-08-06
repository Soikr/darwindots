{
  description = "";

  outputs = {
    self,
    pkgs,
    darwin,
    hm,
    brew,
    ...
  } @ inputs: let
    systems = [
      "x86_64-darwin"
      "x86_64-linux"
    ];

    forAllSystems = pkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: pkgs.legacyPackages.${system}.alejandra);

    darwinConfigurations.snowmalus = darwin.lib.darwinSystem {
      specialArgs = {inherit inputs self;};

      modules = [
        ./hosts/snowmalus
        brew.darwinModules.nix-homebrew
        hm.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.soikr = import ./hm;
          };
        }
      ];
    };

    nixosConfigurations = {
      avalanche = pkgs.lib.nixosSystem {
        modules = [];
      };
    };
  };

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "pkgs";
    };

    brew.url = "github:zhaofengli/nix-homebrew";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "pkgs";
    };

    preservation.url = "github:nix-community/preservation";

    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "pkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "pkgs";
    };

    microvm = {
      url = "github:astro/microvm.nix";
      inputs.nixpkgs.follows = "pkgs";
    };

    crowdsec = {
      url = "git+https://codeberg.org/kampka/nix-flake-crowdsec.git";
      inputs.nixpkgs.follows = "pkgs";
    };

    flakevim = {
      url = "github:Soikr/flakevim";
      inputs.nixpkgs.follows = "pkgs";
    };
  };

  nixConfig = {
    extra-experimental-features = ["nix-command" "flakes"];

    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://microvm.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
    ];
  };
}
