{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nix-colors-adapters.homeManagerModules.default
  ];

  #colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-terminal-storm;
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  nixColorsAdapters = {
    kvantum.enable = false;
    firefox = {
      enable = true;
      profiles = [ "New-Main" ];
      };
    rofi.enable = true;
   };
}
