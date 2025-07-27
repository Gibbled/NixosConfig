{ config, pkgs, lib, ... }:

{
  options = {
    hyprlock-program.enable =
    lib.mkEnableOption "enables waybar for the shell";
  };

  config = lib.mkIf config.hyprlock-program.enable {

      programs.hyprlock = {
        enable = true;
	package = pkgs.hyprlock;
	settings = {
          "$font" = "Monospace";
          general = {
            "hide_cursor" = "false";
           };

        animations = {
          "enabled" = "true";
          "bezier" = "linear, 1, 1, 0, 0";
          animation = [
	  "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
         ];

         background = {
         "monitor" = "";
         "path" = "screenshot";
         "blur_passes" = "3";
         };

        input-field = {
          monitor = "";
          size = "20%, 5%";
          outline_thickness = "3";
          inner_color = "rgba(0, 0, 0, 0.0) # no fill";
          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";
          font_color = "rgb(143, 143, 143)";
          fade_on_empty = "false";
          rounding = "15";
          font_family = "$font";
          placeholder_text = "Input password...";
          fail_text = " $PAMFAIL";
          dots_spacing = "0.3";
          position = "0, -20";
          halign = "center";
          valign = "center";
         };

       label = {
         monitor = "";
         text = " $TIME # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution";
         font_size = "90";
         font_family = " $font";
         position = "-30, 0";
         halign = "right";
         valign = "top";
        };
};
};
};
};
}






