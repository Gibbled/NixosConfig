{ config, pkgs,  ... }:

{
  home.username = "ranjit";
  home.homeDirectory = "/home/ranjit";
  imports = [

  ];

  xresources.properties = {
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  xdg.configFile = {
  };
}
