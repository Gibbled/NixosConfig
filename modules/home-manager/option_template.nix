{ config, pkgs, lib, ... }:

let 
  prog = "the program name";
  optname = "${prog}-program";
  message = "add your message here";
  pkgname = "the name of the package eg pkgs.rofi-wayland";
  
in
{
  options = {
    ${optname}.enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config.${optname}.enable {


      programs.${optname} = {
        enable = true;
 	package = "${pkgname}";
	
        };





};
}








