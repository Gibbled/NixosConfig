{ config, pkgs, specialArgs, ... }:

{   

imports = [

./desktop-environment.nix
./docker.nix
./firefox.nix
./firewall.nix
./flakes.nix
./ldfix.nix
./locale.nix
./neovim.nix
./ollama.nix
./packages.nix
./privoxy.nix
./proxy.nix
./remote-desktop.nix
./searxng.nix
./ssh.nix
./suid.nix
./tor-browser.nix
./virt-manager.nix
./wireshark.nix

];

}
