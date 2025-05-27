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
}
