{ pkgs, config, ... }:
{

  # enable NAT
  networking.nat.enable = true;
  networking.nat.externalInterface = "enp0s25";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the server's end of the tunnel interface.
      #ips = [ "10.100.0.1/24" ];
      ips = [ "172.16.0.1/16" ];

      # The port that WireGuard listens to. Must be accessible by the client.
      listenPort = 51820;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 172.16.0.0/16 -o enp0s25 -j MASQUERADE
      '';

      # This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 172.16.0.0/16 -o enp0s25 -j MASQUERADE
      '';

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/etc/wireguard/keys/management-private.txt";

      peers = [
        # List of allowed peers.
        { 
          name = "xybr";
          publicKey = "/etc/wireguard/keys/xybr-public.txt";
          allowedIPs = [ "172.16.0.3/16" ];
        }
      ];
    };
  };
}
