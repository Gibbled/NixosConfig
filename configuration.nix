{ config, pkgs, ... }:

{
  imports =
    [ 
      ./modules/users/ranjit.nix
      ./modules/system
      ./modules/machines/ax8pro/hardware.nix
      ./hardware-configuration.nix
    ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
