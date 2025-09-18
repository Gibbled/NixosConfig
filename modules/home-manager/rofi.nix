{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    rofi-program.enable = lib.mkEnableOption "enables rofi for the shell";
  };

  config = lib.mkIf config.rofi-program.enable {
    programs.rofi = {
      enable = true;
      font = "Nerd Fonts Hack 18";
      package = pkgs.rofi;
      location = "center";
      plugins = [
        pkgs.rofi-emoji
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

      extraConfig = {
        display-drun = "Applications:";
        drun-display-format = "{icon} {name}";
        font = "Nerd Fonts Hack 18";
        location = 0;
        show-icons = true;
        xoffset = 0;
        yoffset = 0;
      };

      theme = let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          background-color = mkLiteral "#${config.colorScheme.palette.base05}20";
          foreground-color = mkLiteral "#${config.colorScheme.palette.base0C}";
          border-color = mkLiteral "#${config.colorScheme.palette.base0C}";
          border-radius = 10;
          text-color = mkLiteral "@foreground-color";
          width = 512;
        };

        "#inputbar" = {
          children = map mkLiteral ["prompt" "entry"];
        };

        "#textbox-prompt-colon" = {
          expand = false;
          str = ":";
          margin = mkLiteral "5px 0.3em 0em 0em";
          text-color = mkLiteral "@foreground-color";
        };
      };
    };
  };
}
