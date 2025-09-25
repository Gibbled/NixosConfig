
{ config, pkgs, lib, ... }:

let 
  prog = "hyprpaper";
  optname = "${prog}-service";
  message = "enable option for hyprpaper config";
  pkgname = pkgs.hyprpaper;
  
in
{
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config."${optname}".enable {


      services."${prog}" = with pkgs; {
        enable = true;
 	package = pkgname;
        settings = {
          ipc = "on";
          splash = false;
          splash_offset = 2.0;
        
          preload =
            [ "/home/ranjit/Downloads/Wallpaper-Bank/wall.jpg" ];
        
          wallpaper = [
            "DP-2,/home/ranjit/Wallpaper-Bank/wall.jpg"
          ];
        };

        
        };

};
}
