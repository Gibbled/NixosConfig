
{ config, pkgs, ... }:

{

services.ddclient = {
  enable = true;
  username = "gragnet";
  passwordFile = "/home/ranjit/.config/ddclient/secret.txt";
  domains = [
    "mithril.homeunix.org"
  ];
};


}

