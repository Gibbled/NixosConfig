{
  config,
  pkgs,
  lib,
  ...
}: let
  prog = "the program name";
  optname = "${prog}-program";
  message = "add your message here";
  pkgname = the name of the package eg pkgs.rofi-wayland without quotes;
in {
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };

  config = lib.mkIf config."${prog}".enable {
    programs.${prog} = {
      enable = true;
      package = pkgname;
    };
  };
}
