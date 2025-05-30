{ config, pkgs, ... }:

{
  imports =
    [ 
      #./modules/users/ranjit.nix
      #./modules/system
      #./modules/machines/ax8pro/hardware.nix
      #./hardware-configuration.nix
      #It's all in the flake now.
    ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
