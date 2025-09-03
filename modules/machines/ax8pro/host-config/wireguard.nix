{
  inputs,
  pkgs,
  sops-nix,
  ...
}: {
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;
  networking.wg-quick.interfaces = let
    systemd.services = {
      wg-quick-wg0 = {
        requires = ["network-online.target" "NetworkManager.service"];
        after = ["graphical.target"];
        wants = ["graphical.target"];
      };
      wg-quick-wg1 = {
        requires = ["network-online.target" "NetworkManager.service"];
        after = ["graphical.target"];
        wants = ["graphical.target"];
      };
    };
  in {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.1.1.3/8"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/keys/privatekey";

      peers = [
        {
          publicKey = "hY8/uhiXJdGcQPw5Cj8sOtDoM+69pR0gZpYsO5SY0yQ=";
          allowedIPs = ["10.1.1.0/24"];
          endpoint = "gragnet.dyndns.org:51820";
          persistentKeepalive = 25;
        }
      ];
    };

    wg1 = {
      # IP address of this machine in the *tunnel network*
      address = [
        #"10.100.0.3/8"
	"172.16.0.3/8"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/keys/privatekey";

      peers = [
        {
	  publicKey = "WMoKSh4bbWvMNBrJq1q8TNTT5fmtAub0sNjh5/Ppxkw=";
          #allowedIPs = ["10.100.0.0/24"];
          allowedIPs = ["172.16.0.0/16"];
          endpoint = "zabbix.homeunix.com:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
