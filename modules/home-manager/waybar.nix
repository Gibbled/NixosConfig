{
  config,
  pkgs,
  nix-colors,
  ...
}: {
  wayland.windowManager.hyprland.systemd.enable = true;
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    style = ''

         * {
             border: none;
             font-family: Font Awesome, Hack, Arial, sans-serif;
             font-size: 13px;
             color: #${config.colorScheme.palette.base0C};
             border-radius: 20px;
         }

         window {
          font-weight: bold;
         }
         window#waybar {
             /* #background: rgba(0, 0, 0, 0);*/
             /*#background: #${config.colorScheme.palette.base01};*/
      background: transparent;
         }
         /*-----module groups----*/
         .modules-right {
             background: #${config.colorScheme.palette.base05};
             margin: 2px 10px 0 0;
         }
         .modules-center {
                 background: #${config.colorScheme.palette.base05};
             margin: 2px 0 0 0;
         }
         .modules-left {
             margin: 2px 0 0 5px;
                 background: #${config.colorScheme.palette.base05};
         }
         /*-----modules indv----*/
         #workspaces button {
             padding: 1px 5px;
             background-color: #${config.colorScheme.palette.base05};
         }
         #workspaces button:hover {
             box-shadow: inherit;
                 background-color: #${config.colorScheme.palette.base0E};
         }

         #workspaces button.focused {
                 background-color: #${config.colorScheme.palette.base0C};
         }

         #clock,
         #battery,
         #cpu,
         #memory,
         #temperature,
         #network,
         #pulseaudio,
         #custom-media,
         #tray,
         #mode,
         #custom-power,
         #custom-menu,
         #idle_inhibitor {
             padding: 0 10px;
         }
         #mode {
             color: #${config.colorScheme.palette.base01};
             font-weight: bold;
         }
         #custom-power {
             background-color: #${config.colorScheme.palette.base0A};
             border-radius: 100px;
             margin: 5px 5px;
             padding: 1px 1px 1px 6px;
         }
         /*-----Indicators----*/
         #idle_inhibitor.activated {
             color: #${config.colorScheme.palette.base04};
         }
         #pulseaudio.muted {
             color: #${config.colorScheme.palette.base05};
         }
         #battery.charging {
             color: #${config.colorScheme.palette.base06};
         }
         #battery.warning:not(.charging) {
          color: #${config.colorScheme.palette.base07};
         }
         #battery.critical:not(.charging) {
             color: #${config.colorScheme.palette.base08};
         }
         #temperature.critical {
             color: #${config.colorScheme.palette.base09};
         }
         /*-----Colors----*/
         /*
          *rgba(0,85,102,1),#005566 --> Indigo(dye)
          *rgba(0,43,51,1),#002B33 --> Dark Green
          *rgba(0,153,153,1),#009999 --> Persian Green
          *
          */
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        width = 1920;
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "mpd"
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"
          "clock"
          "tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "\{name\}: \{icon\}";
          format-icons = {
            focused = "<span color=\"#${config.colorScheme.palette.base0E}\"></span>";
            default = "";
          };
        };
        mpd = {
          format = "\{stateIcon\} \{consumeIcon\}\{randomIcon\}\{repeatIcon\}\{singleIcon\}\{artist\} - \{album\} - \{title\} \(\{elapsedTime:%M:%S\}\/\{totalTime:%M:%S\}) ⸨\{songPosition\}|\{queueLength\}⸩ \{volume\}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "\{consumeIcon\}\{randomIcon\}\{repeatIcon\}\{singleIcon\}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          icon-size = 21;
          spacing = 10;
          icons = {
            blueman = "bluetooth";
            SignalDesktop = "$HOME/.local/share/icons/hicolor/16x16/apps/signal.png";
          };
        };
        clock = {
          timezone = "Europe/Brussels";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = "";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ''["", "", ""] '';
          };
          on-click = "pavucontrol";
        };
      };
    };
  };
}
