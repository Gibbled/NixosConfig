{ config, pkgs,  ... }:

{
  home.username = "ranjit";
  home.homeDirectory = "/home/ranjit";
  imports = [
  ];

  xresources.properties = {
    "Xcursor.size" = 20;
    "Xft.dpi" = 172;
  };


  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
