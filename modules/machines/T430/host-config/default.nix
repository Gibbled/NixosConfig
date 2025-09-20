{ config, pkgs, specialArgs, ... }:

{   

imports = [
./smartd.nix
./packages.nix
./ddclient.nix
./sops.nix
./wireguard_server.nix
./locale.nix
];

}
