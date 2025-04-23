{ pkgs, ... }: {
  networking.wg-quick.interfaces = let
    server_ip = "cloud.homeunix.org";
  in {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.1.1.3/32"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/keys/privatekey";

      peers = [{
        publicKey = "hY8/uhiXJdGcQPw5Cj8sOtDoM+69pR0gZpYsO5SY0yQ=";
        allowedIPs = [ "10.1.1.0/8" ];
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}



