{ pkgs,  ...}:

{

  stylix = {
  enable = true;
  #autoEnable = false;
  #targets.neovim.enable = false;
  #targets.blender.enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml"; 
  #cursor.package = pkgs.bibata-cursors;
  #cursor.name = "Bibata-Modern-Ice";
  #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml"; 
  fonts = {
    serif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 16;
      terminal = 18;
      desktop = 18;
      popups = 14;
    };

  };

    opacity = {
      applications = 0.8;
      terminal = 0.4;
      desktop = 0.8;
      popups = 0.6;
    };

  


  };

}
