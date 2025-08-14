{
  config,
  pkgs,
  lib,
  ...
}: 
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
        format = lib.concatStrings [
          "[](#${config.colorScheme.palette.base05})"
          "$hostname"
          "$username"
          "[🯫](bg:#${config.colorScheme.palette.base05} fg:#${config.colorScheme.palette.base05})"
          "$directory"
          "[🯫](fg:#${config.colorScheme.palette.base05} bg:#${config.colorScheme.palette.base05})"
          "$git_branch"
          "$git_status"
          "[🯫](fg:#${config.colorScheme.palette.base05} bg:#${config.colorScheme.palette.base05})"
          "$c"
          "$elixir"
          "$elm"
          "$golang"
          "$gradle"
          "$haskell"
          "$java"
          "$julia"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "[🯫](fg:#${config.colorScheme.palette.base05} bg:#${config.colorScheme.palette.base05})"
          "$docker_context"
          "[🯫](fg:#${config.colorScheme.palette.base05} bg:#${config.colorScheme.palette.base05})"
          "$time"
          "[🯫](fg:#${config.colorScheme.palette.base05})"
        ];

        # Disable the blank line at the start of the prompt

        # You can also replace your username with a neat symbol like   or disable this
        # and use the os module below
        username = {
          show_always = true;
          style_user = "bg:#${config.colorScheme.palette.base05}";
          style_root = "bg:#${config.colorScheme.palette.base0B}";
          format = "[$user ]($style)";
          disabled = false;
        };

        hostname = {
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[$hostname ]($style)";
          ssh_only = false;
          ssh_symbol = "🌏 ";
          disabled = false;
        };

        # An alternative to the username module which displays a symbol that
        # represents the current operating system
        os = {
          style = "bg:#${config.colorScheme.palette.base05}";
          disabled = false;
        };

        directory = {
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $path ]($style)";
          truncation_length = 10;
          truncation_symbol = "";
        };

        directory.substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };

        c = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        cpp = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        docker_context = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol $context ]($style)";
        };

        elixir = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        elm = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        git_branch = {
          symbol = "";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol $branch ]($style)";
        };

        git_status = {
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[$all_status$ahead_behind ]($style)";
        };

        golang = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        gradle = {
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        haskell = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        java = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        julia = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        nim = {
          symbol = "󰆥 ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        scala = {
          symbol = " ";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ $symbol ($version) ]($style)";
        };

        time = {
          disabled = true;
          time_format = "%R";
          style = "bg:#${config.colorScheme.palette.base05}";
          format = "[ ♥ $time ]($style)";
        };
      };
    };
  };
}
