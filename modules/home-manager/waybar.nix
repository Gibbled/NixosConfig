{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.systemd.enable = true;
  programs.waybar = {
      enable = true;
      systemd = {
      enable = true;
      target = "hyprland-session.target";

      };
    };



}

