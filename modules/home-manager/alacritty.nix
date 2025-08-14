{
  pkgs,
  config,
  lib,
  nix-colors,
  ...
}: {
  programs.alacritty = {
    enable = true;
    #theme = "tokyo_night_enhanced";
    settings = {
      window.opacity = lib.mkForce 0.8;
      colors = {
        primary = {
        background = "#${config.colorScheme.palette.base01}";
        foreground = "#${config.colorScheme.palette.base05}";
	};

        cursor = {
        cursor = "#${config.colorScheme.palette.base07}";
	};

        selection = {
        text = "#${config.colorScheme.palette.base00}";
        background = "#${config.colorScheme.palette.base02}";
	};

        normal = {
        black = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base03}";
        green = "#${config.colorScheme.palette.base06}";
        yellow = "#${config.colorScheme.palette.base05}";
        blue = "#${config.colorScheme.palette.base07}";
        magenta = "#${config.colorScheme.palette.base03}";
        cyan = "#${config.colorScheme.palette.base06}";
        white = "#${config.colorScheme.palette.base02}";
	};

        bright = {
        black = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base06}";
        green = "#${config.colorScheme.palette.base07}";
        yellow = "#${config.colorScheme.palette.base08}";
        blue = "#${config.colorScheme.palette.base09}";
        magenta = "#${config.colorScheme.palette.base0A}";
        cyan = "#${config.colorScheme.palette.base0B}";
        white = "#${config.colorScheme.palette.base0C}";
	};
      };
    };
  };
}
