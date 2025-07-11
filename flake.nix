{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
     sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
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
    #lanzaboote = {
      #url = "github:nix-community/lanzaboote/v0.4.2";

      # Optional but recommended to limit the size of your system closure.
      #inputs.nixpkgs.follows = "nixpkgs";
    #};
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, flake-parts, plasma-manager, sops-nix, stylix, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
    flake = {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      xybr = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
	  ./modules/system
	  ./modules/machines/ax8pro/hardware.nix
	  ./modules/users/ranjit.nix
          ./hardware-configuration.nix
	  sops-nix.nixosModules.sops
	  stylix.nixosModules.stylix

	  #lanzaboote.nixosModules.lanzaboote

	    #({ pkgs, lib, ... }: {

            #environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              #pkgs.sbctl
            #];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            #boot.loader.systemd-boot.enable = lib.mkForce false;

            #boot.lanzaboote = {
              #enable = true;
              #pkiBundle = "/var/lib/sbctl";
            #};
          #})


          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ 

	      plasma-manager.homeManagerModules.plasma-manager 
              sops-nix.homeManagerModules.sops
	      ];
	    home-manager.backupFileExtension = "backup";


            # TODO replace ryan with your own username
            #home-manager.users.ranjit = import ./flakes/home-manager/home.nix;
            home-manager.users.ranjit = import ./flakes/home-manager;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
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
