{ pkgs, config, home-manager, ...}:

{
         modules = [ home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [

                plasma-manager.homeManagerModules.plasma-manager
                sops-nix.homeManagerModules.sops
                ];
              home-manager.backupFileExtension = "backup";


              home-manager.users.ranjit = import ./flakes/home-manager;

            };
	    ];
}
