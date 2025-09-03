{ config, pkgs, specialArgs, ... }:

{   

imports = [
./smartd.nix
./packages.nix
./ddclient.nix
];

}
