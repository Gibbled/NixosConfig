{pkgs, config, home-manager, ...}:

{
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
        }
	}

