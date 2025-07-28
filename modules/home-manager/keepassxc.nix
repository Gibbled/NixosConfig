{ config, pkgs, lib, ... }:

let 
  prog = "keepassxc";
  optname = "${prog}-program";
  message = "Enable keepassxc with config with keepassxc-program.enable = true;";
  pkgname = pkgs.keepassxc;
  
in
{
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config."${optname}".enable {


      programs."${prog}" = with pkgs; {
        enable = true;
 	package = pkgname;
        settings = {
          Browser.Enabled = true;

          GUI = {
            AdvancedSettings = true;
            ApplicationTheme = "dark";
            CompactMode = true;
            HidePasswords = true;
          };

          SSHAgent.Enabled = true;
          };
 	
        };





};
}








