{ config, pkgs, specialArgs, ... }:

{   

imports = [

./ollama.nix
./ddclient.nix
./smartd.nix
];

}
