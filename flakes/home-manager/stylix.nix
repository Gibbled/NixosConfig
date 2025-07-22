{ config, pkgs,  ... }:

{
stylix = {
targets.firefox.colorTheme.enable = true;
targets.firefox.enable = true;
targets.firefox.profileNames = [ "New-Main" ];
targets.neovim.enable = false;

#targets.kde.decorations = "__aurorae__svg__Sweet-Dark-transparent";
targets.kde.decorations = "Sweet-Dark-transparent";
};




}

