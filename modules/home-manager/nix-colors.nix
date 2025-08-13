{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    #inputs.nix-colors-adapters.homeManagerModules.default
  ];

  #colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  #colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-city-dark;
  #nixColorsAdapters = {
    #kvantum.enable = false;
    #firefox = {
      #enable = true;
      #profiles = [ "New-Main" ];
      #};
    #rofi.enable = true;
    #alacritty.enable = true;
   #};
}
