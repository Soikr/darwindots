{
  description = "Awesome MacOS Nix flake";

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
 
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:

    let
      nixpkgsConfig = {
        allowUnfree = true;
	allowUnsupportedSystem = false;
      };

      user = "aridflake";
      hostname = "Arids-iMac";
      system = "x86_64-darwin";
    in {

    formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system;

      pkgs = import nixpkgs {
        system = "x86_64-darwin";
        config.allowUnfree = true;
      };

      specialArgs = { inherit inputs; };

      modules = [

        inputs.nix-index-database.darwinModules.nix-index
        ./darwin

	({ pkgs, inputs, ... }: {

	  nixpkgs.config = nixpkgsConfig;

	  system = {
	    stateVersion = 4;
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
	    package = pkgs.nixFlakes;
	    gc = {
	      automatic = false;
	      user = user;
	    };
	    settings = {
	      allowed-users = [ user ];
	      experimental-features = [ "nix-command" "flakes" ];
	      warn-dirty = false;
	      auto-optimise-store = false;
	    };
	  };

	})

        home-manager.darwinModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

	    extraSpecialArgs = {
	      inherit inputs;
	    };
          

	    users.${user} = { ... }:
	      with inputs; {
	        imports = [ ./home-manager];
	        home.stateVersion = "24.05";
	      };
            };
	}
      ];
    };
  };
}
