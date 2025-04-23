{ config, pkgs, specialArgs, ...}:

{


imports = [
./home.nix
./plasma-manager.nix
./firefox.nix
./sops.nix
];


}
