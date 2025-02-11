{ config, pkgs, ... }:

{
  imports =
    [ 
      ./modules/users/ranjit.nix
      ./modules/system/locale.nix
      ./modules/system/ollama.nix
      ./modules/system/searxng.nix
      ./modules/system/privoxy.nix
      ./modules/system/tor-browser.nix
      ./modules/system/packages.nix
      ./modules/system/ssh.nix
      ./modules/system/neovim.nix
      ./modules/system/suid.nix
      ./modules/system/docker.nix
      ./modules/system/flakes.nix
      ./modules/system/firewall.nix
      ./modules/system/proxy.nix
      ./modules/system/ldfix.nix
      ./modules/system/firefox.nix
      ./modules/system/desktop-environment.nix
      ./modules/system/remote-desktop.nix
      ./modules/machines/ax8pro/hardware.nix
      ./hardware-configuration.nix
    ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
