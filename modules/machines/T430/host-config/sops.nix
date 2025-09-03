{
  pkgs,
  inputs,
  config,
  ...
}: {
  sops.secrets.ddclient_secret = {
    path = "/home/ranjit/.config/ddclient/secret.txt";
    owner = config.users.users.ranjit.name;
  };

  #complains about format because of \n missing line terminator.
  #sops.secrets.wireguard-gragnet-public = {
  #restartUnits = [ "wg-quick-wg0.service" ];
  #path = "/etc/wireguard/keys/xybr-public.txt";
  #};
  sops.secrets.wireguard-stinkpadPrivate = {
    restartUnits = ["wg-quick-wg0.service"];
    path = "/etc/wireguard/keys/management-private.txt";
  };

  sops.secrets.wireguard-stinkpadPublic = {
    restartUnits = ["wg-quick-wg0.service"];
    path = "/etc/wireguard/keys/management-public.txt";
  };

  #sops.secrets.wireguard-xybrPrivate = {
  #restartUnits = [ "wg-quick-wg0.service" ];
  #path = "/etc/wireguard/keys/xybrPrivate.key";
  #};

  sops.secrets.wireguard-xybrPublic = {
    restartUnits = ["wg-quick-wg0.service"];
    path = "/etc/wireguard/keys/xybrPublic.key";
  };
}
