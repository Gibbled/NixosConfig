{ config, pkgs, specialArgs, ...}:

{


imports = [
./home.nix
./plasma-manager.nix
./firefox.nix
./sops.nix
./git.nix
./starship.nix
./bash.nix
./home-packages.nix
./nvim.nix
./dotfiles.nix
./stylix.nix
#./fonts.nix
];


}
