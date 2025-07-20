{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
     sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    flake-parts.url = "github:hercules-ci/flake-parts";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, flake-parts, plasma-manager, sops-nix, stylix, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
    flake = {
    nixosConfigurations = {
      xybr = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";

        modules = [
          ./configuration.nix
	  ./modules/system
	  ./modules/machines/ax8pro/hardware.nix
	  ./modules/machines/ax8pro/hardware-configuration.nix
	  ./modules/machines/ax8pro/host-config
	  ./modules/users/ranjit.nix
	  sops-nix.nixosModules.sops
	  stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 

	      plasma-manager.homeManagerModules.plasma-manager 
              sops-nix.homeManagerModules.sops
	      ];
	    home-manager.backupFileExtension = "backup";


            home-manager.users.ranjit = import ./flakes/home-manager;

          }
        ];
      };

      stinkpad = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";

        modules = [
          ./configuration.nix
	  ./modules/system
	  ./modules/machines/T430/hardware.nix
	  ./modules/machines/T430/hardware-configuration.nix
	  ./modules/machines/T430/host-config
	  ./modules/users/ranjit.nix
	  sops-nix.nixosModules.sops
	  stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 

	      plasma-manager.homeManagerModules.plasma-manager 
              sops-nix.homeManagerModules.sops
	      ];
	    home-manager.backupFileExtension = "backup";


            home-manager.users.ranjit = import ./flakes/home-manager;

          }
        ];
      };
    };
    };
  systems = [
    "x86_64-linux"
  ];
  };
}
