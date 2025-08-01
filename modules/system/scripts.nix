{ pkgs, config, ...}:
let
  change-wallpaper = pkgs.writeShellScriptBin "change-wallpaper" ''
    export WAYLAND_DISPLAY="wayland-1"
    ${pkgs.swww}/bin/swww img -t random --transition-step 10  --transition-duration 10 --transition-bezier 0.0,0.0,1.0,1.0 "`${pkgs.findutils}/bin/find /home/ranjit/Downloads/Wallpaper-Bank/ -type f -print|${pkgs.coreutils-full}/bin/shuf -n 1`"
    '';
in
 {
  environment.systemPackages = [ change-wallpaper ];
}
