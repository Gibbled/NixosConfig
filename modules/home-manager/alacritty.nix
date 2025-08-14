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
      window.opacity = lib.mkForce 0.5;
      colors = {
        primary = {
        background = "#${config.colorScheme.palette.base02}";
        foreground = "#${config.colorScheme.palette.base0C}";
	};

        cursor = {
        cursor = "#${config.colorScheme.palette.base0C}";
	};

        selection = {
        text = "#${config.colorScheme.palette.base00}";
        background = "#${config.colorScheme.palette.base0D}";
	};

        normal = {
        black = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base02}";
        green = "#${config.colorScheme.palette.base04}";
        yellow = "#${config.colorScheme.palette.base06}";
        blue = "#${config.colorScheme.palette.base08}";
        magenta = "#${config.colorScheme.palette.base0A}";
        cyan = "#${config.colorScheme.palette.base0B}";
        white = "#${config.colorScheme.palette.base0C}";
	};

        bright = {
        black = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base02}";
        green = "#${config.colorScheme.palette.base04}";
        yellow = "#${config.colorScheme.palette.base06}";
        blue = "#${config.colorScheme.palette.base08}";
        magenta = "#${config.colorScheme.palette.base0A}";
        cyan = "#${config.colorScheme.palette.base0B}";
        white = "#${config.colorScheme.palette.base0C}";
	};
      };
    };
  };
}
