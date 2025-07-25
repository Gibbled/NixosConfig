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

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

   outputs = inputs @ { nixpkgs, home-manager,sops-nix, ... }:
    let
      userOptions = {
        userName = "ranjit";
      };
      systemOptions = { 
	
      };
     
    in

    {
    system.stateVersion = "24.05"; # Did you read the comment? Yep!

    nixosConfigurations = {
      xybr = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";


        modules = [
          ./configuration.nix
	  ./modules/system
	  ./modules/machines/ax8pro
	  ./modules/users/ranjit.nix
	  sops-nix.nixosModules.sops

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 
            sops-nix.homeManagerModules.sops
	      ];
	    home-manager.backupFileExtension = "backup";
            #home-manager.users.ranjit = import ./flakes/home-manager;
            home-manager.users.ranjit = import ./modules/home-manager;
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

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 
            sops-nix.homeManagerModules.sops
	      ];
	    home-manager.backupFileExtension = "backup";
            home-manager.users.ranjit = import ./flakes/home-manager;

         }
        ];
      };
    };

    };



}
