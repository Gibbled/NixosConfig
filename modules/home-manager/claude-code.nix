{
  config,
  pkgs,
  lib,
  ...
}: let
  prog = "claude-code";
  optname = "${prog}-program";
  message = "enable claude code";
  pkgname = pkgs.claude-code;
in {
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };

  config = lib.mkIf config."${optname}".enable {
    programs.${prog} = with pkgs; {
      enable = true;
      enableMcpIntegration = true;
      package = pkgname;
    };
  };
}
