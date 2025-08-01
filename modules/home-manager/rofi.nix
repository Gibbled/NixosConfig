{ config, pkgs, lib, ... }:

{
  options = {
    rofi-program.enable = lib.mkEnableOption "enables rofi for the shell";
  };


  config = lib.mkIf config.rofi-program.enable {


      programs.rofi = {
        enable = true;
        font = "Nerd Fonts Hack 18";
	package = pkgs.rofi-wayland;
	location = "top-right";
	plugins = [
	  pkgs.rofi-emoji-wayland
	  pkgs.rofi-systemd
	  pkgs.rofi-menugen
	  pkgs.rofi-network-manager
	  pkgs.pinentry-rofi
	  ];
	modes = [
	 "window"
	 "drun"
	 "run"
	 "ssh"
	 "combi"
	 "keys"
	 "filebrowser"
	 "recursivebrowser"
	 "emoji"
	  ];
	
	

	
        };





};
}







