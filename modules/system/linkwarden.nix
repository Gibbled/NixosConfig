{
  config,
  pkgs,
  lib,
  ...
}: let
  prog = "linkwarden";
  optname = "${prog}-server";
  message = "Linkwarden Link Database";
  pkgname = "pkgs.linkwarden";
  port = 3100;
  linkwardenHost = "localhost";
  databaseUser = "linkwarden";
  databaseName = "linkwarden";
  databaseHost = "localhost";
  databasePort = 5432;
  databaseDir = "/home/ranjit/databases/postgresql";
  databasePackage = "pkgs.postgresql";
  linkwardenUser = "linkwarden";
  linkwardenGroup = "linkwarden";
  #linkwardenSecretFile = "/home/ranjit/.config/linkwarden/linkwardenSecretFile.txt";
  linkwardenSecretFile = "/run/secrets/linkwarden-secret";
in {
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };

  config = lib.mkIf config."${optname}".enable {
  services.${prog} = {
    enable = true;
    storageLocation = "/storage/linkwarden";
    enableRegistration = true;
    host = "localhost";
    port = 10248;
    environment = {
      NEXTAUTH_URL = "http://localhost:10248/api/v1/auth";
    };
    secretFiles.NEXTAUTH_SECRET = config.sops.secrets.linkwarden-secret.path;
  };
  };
}
