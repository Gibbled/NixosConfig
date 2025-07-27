{ config, pkgs, lib, ... }:

{
  options = {
    waybar-program.enable =
    lib.mkEnableOption "enables waybar for the shell";
  };


  config = lib.mkIf config.waybar-program.enable {


      programs.waybar = {
        enable = true;
        };





};
}







