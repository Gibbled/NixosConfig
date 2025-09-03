{ pkgs, inputs, config, ... }: 

{


#sops.secrets.wireguard-gragnet-private = { 
    #restartUnits = [ "wg-quick-wg0.service" ];
    #path = "/etc/wireguard/keys/privatekey";
#};
#
#sops.secrets.wireguard-gragnet-public = { 
    #restartUnits = [ "wg-quick-wg0.service" ];
    #path = "/etc/wireguard/keys/publickey";
#};

sops.secrets.ddclient_secret = {
     path = "/home/ranjit/.config/ddclient/secret.txt";
     owner = config.users.users.ranjit.name;
};

}
