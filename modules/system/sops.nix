{ pkgs, inputs, config, ... }: 

{

sops.defaultSopsFile = ../../secrets/secrets.yaml;
sops.defaultSopsFormat = "yaml";

sops.age.keyFile = "/home/ranjit/.config/sops/age/keys.txt";

sops.secrets.private_keys = {
  owner = config.users.users.ranjit.name;
};
sops.secrets.ranjit-password = { 
  neededForUsers = true;
};

sops.secrets.wireguard-gragnet = { 
    restartUnits = [ "wg-quick-wg0.service" ];
    path = "/etc/wireguard/keys/privatekey";
};

sops.secrets.Authorized_Keys = {
     path = "/home/ranjit/.ssh/authorized_keys";
     owner = config.users.users.ranjit.name;
};

sops.secrets.Samsung2 = {
    owner = config.users.users.ranjit.name;
};


sops.secrets.github-gibbled = {
  owner = config.users.users.ranjit.name;
};
}
