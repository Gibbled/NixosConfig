{ inputs, pkgs, sops-nix, ... }: 



{
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;
  networking.wg-quick.interfaces = let
  systemd.services.wg-quick-wg1 = {
    requires = [ "network-online.target" "NetworkManager.service" ];
    after = [ "graphical.target" ];
    wants = [ "graphical.target" ];
      };
    server_ip = "zabbix.homeunix.org";
  in {
    wg1 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.100.0.3/32"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/keys/privatekey";

      peers = [{
        publicKey = "hY8/uhiXJdGcQPw5Cj8sOtDoM+69pR0gZpYsO5SY0yQ=";
        allowedIPs = [ "10.100.0.0/8" ];
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}



