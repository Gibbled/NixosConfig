{ config, pkgs,  ... }:

{
stylix = {
targets.firefox.colorTheme.enable = true;
targets.firefox.enable = true;
targets.firefox.profileNames = [ "New-Main" ];
targets.neovim.enable = false;

};




}

