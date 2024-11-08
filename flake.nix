{
  description = "Personal MacOS dotfiles :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    meowvim.url = "github:Soikr/meowvim";

    # sbarlua = {
    #   url = "github:FelixKratz/SbarLua";
    #   flake = false;
    # };
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    ...
  } @ inputs: let
    overlays = with inputs; [meowvim.overlay];

    user = "soikr";
    hostname = "snowmalus";
    system = "x86_64-darwin";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit inputs self overlays user hostname;};

      modules = [
        inputs.nix-index-database.darwinModules.nix-index
        ./darwin
        home-manager.darwinModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {inherit inputs;};

            users.${user} = {...}:
              with inputs; {
                imports = [
                  ./hm
                  nixcord.homeManagerModules.nixcord
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
