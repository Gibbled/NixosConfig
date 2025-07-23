{ config, pkgs,  ... }:

{
stylix = {
targets.firefox.colorTheme.enable = true;
targets.firefox.enable = true;
targets.firefox.profileNames = [ "New-Main" ];
targets.firefox.firefoxGnomeTheme.enable = true;
targets.neovim.enable = false;
targets.kde.enable = false;
targets.blender.enable = true;

};




}

