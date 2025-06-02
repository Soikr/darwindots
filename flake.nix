{
  description = "Personal MacOS dotfiles :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Programs

    meowvim = {
      url = "github:Soikr/meowvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darwin

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## Homebrew

    homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-services = {
      url = "github:homebrew/homebrew-services";
      flake = false;
    };

    homebrew-ytm = {
      url = "github:th-ch/homebrew-youtube-music";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    homebrew,
    ...
  } @ inputs: let
    overlays = with inputs; [meowvim.overlay];

    user = "soikr";
    hostname = "snowmalus";
    system = "x86_64-darwin";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit inputs self overlays user hostname;};

      modules = [
        inputs.nix-index-database.darwinModules.nix-index
        homebrew.darwinModules.nix-homebrew
        ./darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {inherit inputs;};

            users.${user} = {...}:
              with inputs; {
                imports = [
                  ./hm
                  meowvim.meowvim
                ];
                home.stateVersion = "24.05";
                meowvim = {
                  ideavim.enable = true;
                };
              };
          };
        }
      ];
    };
  };
}
