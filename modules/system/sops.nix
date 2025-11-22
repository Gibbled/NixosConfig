{
  pkgs,
  inputs,
  config,
  ...
}: {
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/ranjit/.config/sops/age/keys.txt";

    secrets = {
      private_keys = {
        owner = config.users.users.ranjit.name;
        path = "/home/ranjit/.ssh/id_ed25519-20250202";
      };
      public_keys = {
        owner = config.users.users.ranjit.name;
        path = "/home/ranjit/.ssh/id_ed25519-20250202.pub";
      };
      ranjit-password = {
        neededForUsers = true;
      };

      #authorized_keys = {
      #         path = "/home/ranjit/.ssh/authorized_keys";
      #owner = config.users.users.ranjit.name;
      #};

      publicKey_id_noringu_ecdsa = {
        path = "/home/ranjit/.ssh/id_noringu_ecdsa.pub";
        owner = config.users.users.ranjit.name;
      };
      publicKey_id_ringu_ecdsa = {
        path = "/home/ranjit/.ssh/id_ringu_ecdsa.pub";
        owner = config.users.users.ranjit.name;
      };
      publicKey_xybr_id_ed25519-20250202 = {
        path = "/home/ranjit/.ssh/xybr_id_ed25519-20250202.pub";
        owner = config.users.users.ranjit.name;
      };
      publicKey_xybr_id_rsa = {
        path = "/home/ranjit/.ssh/xybr_id_rsa.pub";
        owner = config.users.users.ranjit.name;
      };

      privateKey_id_noringu_ecdsa = {
        path = "/home/ranjit/.ssh/id_noringu_ecdsa";
        owner = config.users.users.ranjit.name;
      };

      privateKey_id_ringu_ecdsa = {
        path = "/home/ranjit/.ssh/id_ringu_ecdsa";
        owner = config.users.users.ranjit.name;
      };

      privateKey_xybr_id_ed25519-20250202 = {
        path = "/home/ranjit/.ssh/xybr_id_ed25519-20250202";
        owner = config.users.users.ranjit.name;
      };

      privateKey_xybr_id_rsa = {
        path = "/home/ranjit/.ssh/xybr_id_rsa";
        owner = config.users.users.ranjit.name;
      };

      linkwarden-secret = {
        path = "/run/secrets/linkwarden-secret";
        owner = config.users.users.linkwarden.name;
      };

      Samsung2 = {
        owner = config.users.users.ranjit.name;
      };

      github-gibbled = {
        owner = config.users.users.ranjit.name;
      };
    };
  };
}
