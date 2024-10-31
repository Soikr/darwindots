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

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixcord = {
    #  url = "github:KaylorBen/nixcord";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    meowvim.url = "github:Soikr/meowvim";

    NeptuneFox = {
      url = "github:yiiyahui/Neptune-Firefox";
      flake = false;
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sbarlua = {
      url = "github:FelixKratz/SbarLua";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    arkenfox,
    #nixcord,
    nur,
    ...
  } @ inputs: let
    nixpkgsConfig = {
      allowUnfree = true;
      allowUnsupportedSystem = false;
    };

    overlays = with inputs; [meowvim.overlay];

    user = "soikr";
    hostname = "snowmalus";
    system = "x86_64-darwin";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit inputs;};

      modules = [
        inputs.nix-index-database.darwinModules.nix-index
        ./darwin

        ({
          pkgs,
          inputs,
          ...
        }: {
          nixpkgs.config = nixpkgsConfig;
          nixpkgs.overlays = overlays;

          services.nix-daemon.enable = true;

          system = {
            stateVersion = 5;
            configurationRevision = self.rev or self.dirtyRev or null;
          };

          users.users.${user} = {
            home = "/Users/${user}";
            shell = pkgs.zsh;
          };

          networking = {
            computerName = hostname;
            hostName = hostname;
            localHostName = hostname;
          };

          nix = {
            package = pkgs.nixVersions.git;
            gc = {
              automatic = true;
              options = "--delete-older-than +2";
              user = user;
            };
            settings = {
              allowed-users = [user];
              experimental-features = ["nix-command" "flakes"];
              warn-dirty = false;
              auto-optimise-store = true;
            };
          };
        })

        home-manager.darwinModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {inherit inputs;};

            users.${user} = {...}:
              with inputs; {
                imports = [
                  ./home-manager
                  arkenfox.hmModules.default
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
