
{ config, pkgs, lib, nix-colors, ... }:

let 
  prog = "dunst";
  optname = "${prog}-service";
  message = "enable option for dunst config";
  pkgname = pkgs.dunst;
  
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
      global = {
        browser = "${config.programs.firefox.package}/bin/firefox -new-tab";
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
        follow = "mouse";
        font = "Font Awesome, Hack, Sans 18";
        format = "<b>%s</b>\\n%b";
        frame_color = "#${config.colorScheme.palette.base0A}";
        frame_width = 2;
        horizontal_padding = 8;
        icon_position = "left";
        line_height = 0;
        markup = "full";
        padding = 8;
        separator_color = "frame";
        separator_height = 2;
        transparency = 60;
        word_wrap = true;
	corner_radius = 20;
	corners = "all";
	origin = "top-right";
	offset = "(10,40)";
      };

      urgency_low = {
        background = "${config.colorScheme.palette.base0C}";
        foreground = "${config.colorScheme.palette.base01}";
        frame_color = "${config.colorScheme.palette.base02}";
        timeout = 10;
      };

      urgency_normal = {
        background = "${config.colorScheme.palette.base0A}";
        foreground = "${config.colorScheme.palette.base01}";
        frame_color = "${config.colorScheme.palette.base02}";
        timeout = 15;
      };

      urgency_critical = {
        background = "${config.colorScheme.palette.base0B}";
        foreground = "${config.colorScheme.palette.base01}";
        frame_color = "${config.colorScheme.palette.base02}";
        timeout = 0;
      };
      };

        
        };

};
}
