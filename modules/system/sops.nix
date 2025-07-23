{ pkgs, inputs, config, ... }: 

{

sops.defaultSopsFile = ../../secrets/secrets.yaml;
sops.defaultSopsFormat = "yaml";

sops.age.keyFile = "/home/ranjit/.config/sops/age/keys.txt";

sops.secrets.private_keys = {
  owner = config.users.users.ranjit.name;
  path = "/home/ranjit/.ssh/id_ed25519-20250202";
};
sops.secrets.public_keys = {
  owner = config.users.users.ranjit.name;
  path = "/home/ranjit/.ssh/id_ed25519-20250202.pub";
};
sops.secrets.ranjit-password = { 
  neededForUsers = true;
};

#sops.secrets.wireguard-gragnet-private = { 
    #restartUnits = [ "wg-quick-wg0.service" ];
    #path = "/etc/wireguard/keys/privatekey";
#};

#sops.secrets.wireguard-gragnet-public = { 
    #restartUnits = [ "wg-quick-wg0.service" ];
    #path = "/etc/wireguard/keys/publickey";
#};

#sops.secrets.ddclient_secret = {
     #path = "/home/ranjit/.config/ddclient/secret.txt";
     #owner = config.users.users.ranjit.name;
#};

sops.secrets.Samsung2 = {
    owner = config.users.users.ranjit.name;
};


sops.secrets.github-gibbled = {
  owner = config.users.users.ranjit.name;
};
}
