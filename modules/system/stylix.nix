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
  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };


}
