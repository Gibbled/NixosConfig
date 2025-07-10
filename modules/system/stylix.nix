{ pkgs,  ...}:

{

  stylix.enable = true;
  #stylix.targets.neovim.enable = false;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml"; 

}
