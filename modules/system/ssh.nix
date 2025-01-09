{ config, pkgs, ...}:

{
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "ranjit" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";

    };
  };
}
