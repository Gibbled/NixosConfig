{ config, inputs, pkgs, sops-nix, ... }:

{

  sops = {
    #age.keyFile = "/home/ranjit/.config/sops/age/keys.txt"; # must have no password!

    defaultSopsFile = ../../sops.yaml;
    validateSopsFiles = false;
   #defaultSymlinkPath = "/run/user/1000/secrets";
    #defaultSecretsMountPoint = "/run/user/1000/secrets.d";
    age = {

      sshKeyPaths = [ "/etc/ssh/host_key_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key";
      generateKey = true;

    };


  };


}

