{ config, pkgs,  ... }:

{
stylix = {
targets.firefox.colorTheme.enable = true;
targets.firefox.enable = true;
targets.firefox.profileNames = [ "New-Main" ];
#targets.firefox.firefoxGnomeTheme.enable = true;
targets.blender.enable = true;

};




}

