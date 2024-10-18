{ lib, pkgs, ... }:
{
  home = {
  packages = with pkgs; [
    hello
  ];


  username = "ranjit";
  homeDirectory = "/home/ranjit";
  };

  stateVersion  = "23.11";
}
