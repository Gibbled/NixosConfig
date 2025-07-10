{ pkgs,  ...}:

{

  stylix = {
  enable = true;
  #autoEnable = false;
  #targets.neovim.enable = false;
  #targets.blender.enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml"; 
  #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml"; 
  };


}
