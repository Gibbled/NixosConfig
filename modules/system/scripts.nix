{ pkgs, config, ...}:
let
  change-wallpaper = pkgs.writeShellScriptBin "change-wallpaper" ''
    ${pkgs.waypaper}/bin/waypaper --random --monitor=DP-2
    '';
in
 {
  environment.systemPackages = [ change-wallpaper ];
}
