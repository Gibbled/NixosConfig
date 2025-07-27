
{ config, pkgs, ... }:

{

services.ddclient = {
  enable = true;
  username = "gragnet";
  passwordFile = "/home/ranjit/.config/ddclient/secret.txt";
  domains = [
    "zabbix.homeunix.org"
  ];
};


}

