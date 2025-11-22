{
  config,
  lib,
  systemSettings,
  userSettings,
  pkgs,
  sops,
  ...
}: {
  home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

  home.file.".config/kitty/current-theme.conf".source = ./dotfiles/kitty/current-theme.conf;
  home.file.".ssh/authorized_keys".source = ./dotfiles/ssh/authorized_keys;
  home.file.".config/hypr/hyprlock-assets/galaxy.jpg".source = ./dotfiles/hyprland/config/hyprlock/Assets/galaxy.jpg;
  home.file.".config/hypr/hyprlock-assets/nixos.png".source = ./dotfiles/hyprland/config/hyprlock/Assets/nixos.png;
  home.file.".config/hypr/hyprlock-assets/Face.png".source = ./dotfiles/hyprland/config/hyprlock/Assets/Face.png;
  home.file.".config/hypr/pyprland.toml".source = ./dotfiles/pyprland/pyprland.toml;
  #home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;

  ##############
}
