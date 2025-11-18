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
    services = {
      ${prog} = {
        enable = true;
        #package = pkgname;
        port = port;
        host = linkwardenHost;
        database.user = databaseUser;
        database.name = databaseName;
        user = linkwardenUser;
        group = linkwardenGroup;
        openFirewall = true;
        database.createLocally = true;
        secretFiles.NEXTAUTH_SECRET = linkwardenSecretFile;
        #cacheLocation = "";
        #storageLocation = "";
        database.port = databasePort;
        database.host = databaseHost;
        #database.host = "/run/postgresql";
        enableRegistration = true;
        # environmentFile = "/run/secrets/linkwarden";
        environment = {
          PAGINATION_TAKE_COUNT = "50";
          NEXTAUTH_SECRET = "secretsecret";
          NEXTAUTH_URL = "http://localhost:3000/api/v1/auth";
          DATABASE_URL = "postgresql://linkwarden:linkwarden@localhost:5432/linkwarden";
        };
      };

      postgresql = {
        enable = true;
        ensureDatabases = ["${databaseName}"];
        settings.port = databasePort;
        #package = "${databasePackage}";
        dataDir = "${databaseDir}";
        authentication = pkgs.lib.mkOverride 10 ''
             #type database  DBuser  auth-method
             local all       all     trust
          '';
      };
    };
  };
}
