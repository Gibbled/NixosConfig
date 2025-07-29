{ config, pkgs, lib, ... }:

{
  options = {
    waybar-program.enable =
    lib.mkEnableOption "enables waybar for the shell";
  };

  config = lib.mkIf config.waybar-program.enable {

      programs.waybar = {
        enable = true;

	settings = ''
	"["
        "{"
        "\"layer\": \"top\","
        "\"position\": \"top\","
        "\"height\": 24,"
        "\"spacing\": 5,"
        "\"modules-left\": ["
        "\"custom/launcher\","
        "\"hyprland/window\","
        "\"custom/texttwo\","
        "\"custom/textthree\","
        "\"custom/textfour\","
        "\"custom/textfive\""
    "],"
    "\"modules-center\": ["
      "\"hyprland/window\""
    "],"
    "\"modules-right\": ["
      "\"mpd\","
      "\"idle_inhibitor\","
      "\"temperature\","
      "\"cpu\","
      "\"memory\","
      "\"network\","
      "\"pulseaudio\","
      "\"backlight\","
      "\"keyboard-state\","
      "\"battery\","
      "\"battery#bat2\","
      "\"tray\","
      "\"clock\""
    "],"
    "\"hyprland/window\": {"
      "\"format\": \"{class}\","
      "\"max-length\": 20,"
      "\"rewrite\": {"
        "\"\^(?!.*\\\\S).*\": \"Finder\""
      "}"
    "},"
    "\"custom/launcher\": {"
      "\"format\": \"🔍\","
      "\"on-click\": \"rofi --show drun\","
      "\"tooltip\": false"
    "},"
    "\"custom/texttwo\": {"
      "\"exec\": \"echo 'File'\","
      "\"\\\"interval\": 60,\""
      "\"return-type\": \"plain\","
      "\"on-click\": \"nautilus\""
    "},"
    "\"custom/textthree\": {"
      "\"exec\": \"echo 'Edit'\","
      "\"interval\": 60,"
      "\"return-type\": \"plain\","
      "\"on-click\": \"gimp\""
    "},"
    "\"custom/textfour\": {"
      "\"exec\": \"echo 'View'\","
      "\"interval\": 60,"
      "\"return-type\": \"plain\""
    "},"
    "\"custom/textfive\": {"
      "\"exec\": \"echo 'Help'\","
      "\"interval\": 60,"
      "\"return-type\": \"plain\","
      "\"on-click\": \"gio open https://github.com/kamlendras/waybar/issues/new\""
    "},"
    "\"keyboard-state\": {"
      "\"numlock\": true,"
      "\"capslock\": true,"
      "\"format\": \"{name} {icon}\","
      "\"format-icons\": {"
        "\"locked\": \"\","
        "\"unlocked\": \"\""
      "}"
    "},"
    "\"hyprland/mode\": {"
      "\"format\": \"<span style=\\\"italic\\\">{}</span>\""
    "},"
    "\"hyprland/scratchpad\": {"
      "\"format\": \"{icon} {count}\","
      "\"show-empty\": false,"
      "\"format-icons\": ["
        "\"\","
        "\"\","
      "],"
      "\"tooltip\": true,"
      "\"tooltip-format\": \"{app}: {title}\""
    "},"
    "\"mpd\": {"
      "\"format\": \"  {title} - {artist} {stateIcon} [{elapsedTime:%M:%S}/{totalTime:%M:%S}] {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}[{songPosition}/{queueLength}] [{volume}%]\","
      "\"format-disconnected\": \" Disconnected\","
      "\"format-stopped\": \" {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped\","
      "\"\"unknown-tag\": \"N/A\",\""
      "\"interval\": 2,"
      "\"consume-icons\": {"
        "\"on\": \" \""
      "},"
      "\"random-icons\": {"
        "\"on\": \" \""
      "},"
      "\"repeat-icons\": {"
        "\"on\": \" \""
      "},"
      "\"single-icons\": {"
        "\"on\": \"1 \""
      "},"
      "\"state-icons\": {"
        "\"paused\": \"\","
        "\"playing\": \"\""
      "},"
      "\"tooltip-format\": \"MPD (connected)\","
      "\"tooltip-format-disconnected\": \"MPD (disconnected)\","
      "\"on-click\": \"mpc toggle\","
      "\"on-click-right\": \"foot -a ncmpcpp ncmpcpp\","
      "\"on-scroll-up\": \"mpc volume +2\","
      "\"on-scroll-down\": \"mpc volume -2\""
    "},"
    "\"idle_inhibitor\": {"
      "\"format\": \"{icon}\","
      "\"format-icons\": {"
        "\"activated\": \"\","
        "\"deactivated\": \"\""
      "}"
    "},"
    "\"tray\": {"
      "\"spacing\": 10"
    "},"
    "\"clock\": {"
      "\"format\": \"{:%A %B %d %H:%M %p}\","
      "\"tooltip-format\": \"<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>\""
    "},"
    "\"cpu\": {"
      "\"format\": \"  {usage}%\""
    "},"
    "\"memory\": {"
      "\"format\": \" {}%\""
    "},"
    "\"temperature\": {"
      "\"thermal-zone\": 2,"
      "\"hwmon-path\": \"/sys/class/hwmon/hwmon2/temp1_input\","
      "\"critical-threshold\": 80,"
      "\"format-critical\": \"{icon} {temperatureC}°C\","
      "\"format\": \"{icon} {temperatureC}°C\","
      "\"format-icons\": ["
        "\"\","
        "\"\","
        "\"\""
      "]"
    "},"
    "\"backlight\": {"
      "\"format\": \"{icon} {percent}%\","
      "\"format-icons\": ["
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\""
      "]"
    "},"
    "\"battery\": {"
      "\"states\": {"
        "\"warning\": 30,"
        "\"critical\": 15"
      "},"
      "\"format\": \"{icon} {capacity}%\","
      "\"format-charging\": \" {capacity}%\","
      "\"format-plugged\": \" {capacity}%\","
      "\"format-alt\": \"{icon} {time}\","
      "\"format-icons\": ["
        "\"\","
        "\"\","
        "\"\","
        "\"\","
        "\"\""
      "]"
    "},"
    "\"battery#bat2\": {"
    "\"bat\": \"BAT2\""
    "},"
    "\"network\": {"
      "\"format-wifi\": \"{essid} ({signalStrength}%) \","
      "\"format-ethernet\": \" {ifname}\","
      "\"tooltip-format\": \" {ifname} via {gwaddr}\","
      "\"format-linked\": \" {ifname} (No IP)\","
      "\"format-disconnected\": \"Disconnected ⚠ {ifname}\","
      "\"format-alt\": \" {ifname}: {ipaddr}/{cidr}\""
    "},"
    "\"pulseaudio\": {"
      "\"scroll-step\": 5,"
      "\"format\": \"{icon}  {volume}% {format_source}\","
      "\"format-bluetooth\": \" {icon} {volume}% {format_source}\","
      "\"format-bluetooth-muted\": \"  {icon} {format_source}\","
      "\"format-muted\": \"  {format_source}\","
      "\"format-source\": \" {volume}%\","
      "\"format-source-muted\": \"\","
      "\"format-icons\": {"
        "\"default\": ["
          "\"\","
          "\"\","
          "\"\""
        "]"
      "},"
      "\"on-click\": \"pavucontrol\","
      "\"on-click-right\": \"foot -a pw-top pw-top\""
    "}"
  "},"
  "{"
    "\"layer\": \"top\","
    "\"position\": \"bottom\","
    "\"height\": 41,"
    "\"width\": 2,"
    "\"modules-left\": ["
      "\"custom/os_button\""
    "],"
    "\"modules-center\": ["
      "\"hyprland/mode\","
      "\"wlr/taskbar\""
    "],"
    "\"margin\": \"4\","
    "\"spacing\": \"5\","
    "\"hyprland/window\": {"
      "\"max-length\": 50"
    "},"
    "\"custom/os_button\": {"
      "\"format\": \"🔍\","
      "\"on-click\": \"rofi --show drun\","
      "\"tooltip\": false"
    "},"
    "\"wlr/taskbar\": {"
      "\"format\": \"{icon}\","
      "\"icon-size\": 36,"
      "\"spacing\": 3,"
      "\"on-click-middle\": \"close\","
      "\"tooltip-format\": \"{title}\","
      "\"ignore-list\": [],"
      "\"on-click\": \"activate\""
    "}"
    "}"
    "]"
    '';

	   style = ''
             * {
               font-size: 16px;
               min-height: 0;
               border-radius: 1rem;
               padding: 0.1rem;
             }
             
             window#waybar {
               background: rgba(255, 255, 255, 0.5);
               color: rgb(0, 0, 0);
             }
             
             tooltip {
               background: #000000;
             }
             tooltip label {
               color: white;
             }
             
             #workspaces button {
               padding: 0 5px;
               background: transparent;
               color: white;
               border-bottom: 3px solid transparent;
             }
             
             #workspaces button.focused {
               background: #64727d;
               border-bottom: 3px solid white;
             }
             
             #mode,
             #clock,
             #battery {
               padding: 0 10px;
             }
             
             #mode {
               background: #64727d;
               border-bottom: 3px solid white;
             }
             
             #clock,
             #battery,
             #cpu,
             #memory,
             #disk,
             #temperature,
             #backlight,
             #network,
             #pulseaudio,
             #wireplumber,
             #custom-media,
             #tray,
             #mode,
             #idle_inhibitor,
             #scratchpad,
             #mpd {
               margin: 2px;
               padding-left: 4px;
               padding-right: 4px;
               color: #000000;
             }
             
             .modules-left > widget:first-child > #workspaces {
               margin-left: 0;
             }
             
             .modules-right > widget:last-child > #workspaces {
               margin-right: 0;
             }
             
             #clock {
               font-size: 14px;
             }
             
             #battery icon {
               color: red;
             }
             
             #battery.charging,
             #battery.plugged {
               color: #ffffff;
               background-color: #26a65b;
             }
             
             @keyframes blink {
               to {
                 background-color: #ffffff;
                 color: #000000;
               }
             }
             
             #battery.warning:not(.charging) {
               background-color: #f53c3c;
               color: #ffffff;
               animation-name: blink;
               animation-duration: 0.5s;
               animation-timing-function: linear;
               animation-iteration-count: infinite;
               animation-direction: alternate;
             }
             
             #battery.critical:not(.charging) {
               background-color: #f53c3c;
               color: #ffffff;
               animation-name: blink;
               animation-duration: 0.5s;
               animation-timing-function: linear;
               animation-iteration-count: infinite;
               animation-direction: alternate;
             }
             
             label:focus {
               background-color: #000000;
             }
             
             #network.disconnected {
               background-color: #f53c3c;
             }
             
             #temperature.critical {
               background-color: #eb4d4b;
             }
             
             #idle_inhibitor.activated {
               background-color: #ecf0f1;
               color: #2d3436;
             }
             
             #tray > .passive {
               -gtk-icon-effect: dim;
             }
             
             #tray > .needs-attention {
               -gtk-icon-effect: highlight;
               background-color: #eb4d4b;
             }
             
             #custom-os_button {
               font-size: 32px;
               transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
             }
             #custom-os_button:hover {
               background: white;
               color: black;
             }
             '';
	     };
	     };
             
}
