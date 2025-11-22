{
  config,
  pkgs,
  ...
}: {
  networking.firewall.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [22 11434 8888];
  networking.firewall.allowedUDPPorts = [22 11434 8888];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
