{ pkgs, config, lib, ... }:

{
  programs.alacritty = {

  enable = true;
  theme = "tokyo_night_enhanced";
  settings = {
    window.opacity = lib.mkForce 0.6;
  };
  };
}
