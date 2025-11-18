{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "ranjit";
  home.homeDirectory = "/home/ranjit";
  imports = [
  ];

  xresources.properties = {
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
      pkgs.hyprlandPlugins.xtra-dispatchers
      pkgs.hyprlandPlugins.hyprspace
      pkgs.hyprlandPlugins.hyprexpo
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
  };

  xdg.configFile = {
  };
}
