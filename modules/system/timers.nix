{ config, pkgs, lib, ... }:



{
systemd.timers."change-wallpaper" = {
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "20s";
      OnUnitActiveSec = "20s";
      Unit = "change-wallpaper.service";
    };
};

systemd.services."change-wallpaper" =  {
  serviceConfig = {
    path = with pkgs; [ systemd python3 waypaper bash ];
    ExecStart = "/run/current-system/sw/bin/change-wallpaper";
    Type = "oneshot";
    User = "ranjit";
  };
};

}






