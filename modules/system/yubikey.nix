{
  config,
  pkgs,
  lib,
  configVars,
  ...
}:


let
  homeDirectory = "/home/${configVars.username}";
in
{
  options = {
    yubikey = {
      enable = lib.mkEnableOption "Enable yubikey support";
    };
  };
  config = lib.mkIf config.yubikey.enable {
    environment.systemPackages = builtins.attrValues {
      inherit (pkgs)
      yubioath-flutter # gui-based authenticator tool. yubioath-desktop on older nixpkg channels
      yubikey-manager # cli-based authenticator tool. accessed via `ykman`

      pam_u2f # for yubikey with sudo
      ;
    };

    # Yubikey required services and config. See Dr. Duh NixOS config for
    # reference
    services.pcscd.enable = true; # smartcard service
    services.udev.packages = [ pkgs.yubikey-personalization ];

    services.yubikey-agent.enable = true;

    # yubikey login / sudo
    security.pam = lib.optionalAttrs pkgs.stdenv.isLinux {
      sshAgentAuth.enable = true;
      u2f = {
        enable = true;
        settings = {
          cue = true; # Tells user they need to press the button
          authFile = "${homeDirectory}/.config/Yubico/u2f_keys";
        };
      };
      services = {
        login.u2fAuth = true;
        sudo = {
          u2fAuth = true;
          sshAgentAuth = true; # Use SSH_AUTH_SOCK for sudo
        };
      };
    };
  };
}

