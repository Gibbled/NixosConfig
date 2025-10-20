{ config, pkgs, ... }:

{
  programs.git = {
      enable = true;
      settings.user.name = "Gibbled";
      settings.user.email = "lucksack@gmail.com";
    };



}

