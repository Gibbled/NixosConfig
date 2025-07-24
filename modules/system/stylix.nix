{ pkgs,  ...}:

{

  stylix = {
  enable = true;
  autoEnable = false;
  #targets.neovim.enable = false;
  targets.plymouth.enable = false;
  targets.console.enable = true;
  targets.chromium.enable = true;
  targets.font-packages.enable = true;
  targets.fontconfig.enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml"; 
  fonts = {
    serif = {
      package = pkgs.aleo-fonts;
      name = "Aleo";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Font";
    };

    monospace = {
      package = pkgs.maple-mono.variable;
      name = "Maple Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
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
