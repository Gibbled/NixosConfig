{ config, pkgs, lib, ... }:



{
systemd.timers."change-wallpaper" = {
  after = [ "graphical.target" ];
  wants = [ "graphical.target" ];
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "20m";
      OnUnitActiveSec = "20m";
      Unit = "change-wallpaper.service";
    };
};


systemd.services."change-wallpaper" =  {
  serviceConfig = {
    ExecStart = "/run/current-system/sw/bin/change-wallpaper";
    Type = "oneshot";
    User = "ranjit";
  };
};

}






