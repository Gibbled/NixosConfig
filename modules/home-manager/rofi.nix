{ config, pkgs, lib, ... }:

  {

  options = {
    rofi-program.enable =
    lib.mkEnableOption "enables rofi for the shell";
  };


  config = lib.mkIf config.starship-program.enable {


      programs.rofi = {
        enable = true;
	};
};
}
   
