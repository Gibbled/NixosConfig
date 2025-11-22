{
  pkgs,
  inputs,
  config,
  ...
}: {
  sops.secrets.wireguard-gragnet-private = {
    restartUnits = ["wg-quick-wg0.service"];
    path = "/etc/wireguard/keys/privatekey";
  };

  sops.secrets.wireguard-gragnet-public = {
    restartUnits = ["wg-quick-wg0.service"];
    path = "/etc/wireguard/keys/publickey";
  };

  sops.secrets.ddclient_secret = {
    path = "/home/ranjit/.config/ddclient/secret.txt";
    owner = config.users.users.ranjit.name;
  };

  sops.secrets.wireguard-xybrPrivate = {
    restartUnits = ["wg-quick-wg1.service"];
    path = "/etc/wireguard/keys/xybrPrivate.key";
  };

  sops.secrets.wireguard-xybrPublic = {
    restartUnits = ["wg-quick-wg1.service"];
    path = "/etc/wireguard/keys/xybrPublic.key";
  };
}
