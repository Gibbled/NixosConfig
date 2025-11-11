{ config, pkgs, lib, ... }:

let 
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
  databaseDir = "/home/ranjit/etc/nixos/databases/postgresql";
  databasePackage = "pkgs.postgresql";
  linkwardenUser = "linkwarden";
  linkwardenGroup = "linkwarden";
  
in
{
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config."${optname}".enable {


      services.${prog} = {
        enable = true;
 	package = pkgname;
        port = port; 
	host = linkwardenHost;
	database.user = databaseUser;
	database.name = databaseName;
	user = linkwardenUser;
	group = linkwardenGroup;
	openFirewall = true;
	database.createLocally = true;
	secretFiles = "";
	cacheLocation = "";
	storageLocation = "";
	database.port = databasePort;
	#database.host = databaseHost;
	database.host = "/run/postgresql";
	enableRegistration = true;
	environmentFile = "/run/secrets/linkwarden";
	
        };

        services.postgresql = {
          enable = true;
	  port = databasePort;
	  package = databasePackage;
	  dataDir = databaseDir;

	  

	};



};
}








