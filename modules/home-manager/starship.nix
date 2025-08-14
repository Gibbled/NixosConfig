{ config, pkgs, lib, ... }:

{

options = {
  starship-program.enable = 
  lib.mkEnableOption "enables starship for the shell";
};


config = lib.mkIf config.starship-program.enable {


    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = true;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = false;
	cmd_duration.style = "bold #${config.colorScheme.palette.base08}";
	directory.style = "bold #${config.colorScheme.palette.base0A}";
	hostname.style = "bold #${config.colorScheme.palette.base0C}";
	git_branch.style = "bold #${config.colorScheme.palette.base09}";
	git_status.style = "bold #${config.colorScheme.palette.base0C}";
	username = {
          format = "[$user]($style) on";
	  style_user = "bold #${config.colorScheme.palette.base07}";
	};
	character = {
          success_symbol = "[>](bold #${config.colorScheme.palette.base05})";
	  error_symbol = "[>](bold #${config.colorScheme.palette.base0C})";
	};
      };
    };

};
}


