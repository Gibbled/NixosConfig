{ config, pkgs, lib, nix-colors, home-manager, ... }:

let 
  prog = "hyprlock";
  optname = "${prog}-program";
  message = "Enable hyprlock with config with hyprlock-program.enable = true;";
  pkgname = pkgs.hyprlock;
  imports = [
    "nix-colors.homeManagerModules.default"
  ];
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
	  general = {
	  hide_cursor = "false";
	  };
	background = {
	  monitor = "";
	  path = "/home/ranjit/.config/hypr/hyprlock-assets/galaxy.jpg";
	  blur_passes = "1";
	  contrast = "1";
	  brightness = "0.5";
	  vibrancy = "0.2";
	  vibrancy_darkness = "0.2";
          };
	input-field = {
	  monitor = "";
	  size = "250, 60";
	  outline_thickness = "2";
	  dots_size = "0.2";
          dots_center = true;
	  outer_color = "rgb(${config.colorScheme.palette.base0A})";
	  inner_color = "rgb(${config.colorScheme.palette.base02})";
          font_color = "rgb(${config.colorScheme.palette.base09})";
	  fade_on_empty = false;
	  rounding = "-1";
	  check_color = "rgb(${config.colorScheme.palette.base0B})";
	  placeholder_text = "Enter Password";
	  hide_input = false;
	  position = "0, -200";
	  halign = "center";
	  valign = "center";

	};
	};
        
	extraConfig = ''
          # DATE
          label {
            monitor =
            text = cmd[update:1000] echo "$(date +"%A, %B %d")"
            color = rgba(242, 243, 244, 0.75)
            font_size = 22
            font_family = JetBrains Mono
            position = 0, 300
            halign = center
            valign = center
          }
          
          # TIME
          label {
            monitor = 
            text = cmd[update:1000] echo "$(date +"%-I:%M")"
            color = rgba(242, 243, 244, 0.75)
            font_size = 50
            font_family = Hack Mono
            position = 0, 400
            halign = center
            valign = center
          }
          
          
          
         # Profile Picture
         image {
              monitor =
              path = /home/ranjit/.config/hypr/hyprlock-assets/Face.png
              size = 200
              border_size = 2
              border_color = rgb(${config.colorScheme.palette.base0B})

              position = 0, 20
              halign = center
              valign = center
          }
          
          ### Desktop Environment
          image {
              monitor =
              path = /home/ranjit/.config/hypr/hyprlock-assets/nixos.png
              size = 75
              border_size = 2
              border_color = rgb(${config.colorScheme.palette.base0B})
              position = -50, 50
              halign = right
              valign = bottom
          }

	'';

	};




};
}








