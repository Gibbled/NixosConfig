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


    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland"; # Prevents version mismatch.
    };

    nix-colors.url = "github:misterio77/nix-colors";
    nix-colors-adapters.url = "gitlab:vfosnar/nix-colors-adapters";


  };

   outputs = inputs @ { nixpkgs, home-manager,sops-nix, ... }:

    {
    system.stateVersion = "24.05"; # Did you read the comment? Yep!

    nixosConfigurations = {
      xybr = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";
	specialArgs = { inherit inputs; };


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
	    home-manager.extraSpecialArgs = { inherit inputs; };
	    home-manager.sharedModules = [ 
            sops-nix.homeManagerModules.sops
	      ];
            home-manager.users.ranjit = import ./modules/home-manager;
          }
        ];
      };

      stinkpad = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";
	specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
	  ./modules/system
	  ./modules/machines/T430
	  ./modules/users/ranjit.nix
	  sops-nix.nixosModules.sops

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 
            sops-nix.homeManagerModules.sops
	      ];
            home-manager.users.ranjit = import ./modules/home-manager;
          }
        ];
      };
    };

    };



}
