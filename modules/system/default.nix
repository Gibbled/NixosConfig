{ config, pkgs, specialArgs, ... }:

{   

imports = [

./desktop-environment.nix
#./docker.nix
./firewall.nix
./flakes.nix
./ldfix.nix
#./locale.nix
./neovim.nix
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
./sops.nix
./yubikey.nix
#./stylix.nix
#./tmux.nix
./fonts.nix
./scripts.nix
./timers.nix
./ntopng.nix
#./linkwarden.nix
];

}
