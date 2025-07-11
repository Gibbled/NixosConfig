{ config, pkgs, stylix, ... }:

{

stylix.targets.firefox.colorTheme.enable = true;
stylix.targets.firefox.enable = true;
stylix.targets.firefox.profileNames = [ "New-Main" ];
programs.firefox.profiles.New-Main.extensions.force = true;



}

