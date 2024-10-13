{ config, pkgs, ... }:

{
#This is for Remote Desktop config

services.xrdp.enable = true;
services.xrdp.defaultWindowManager = "startplasma-wayland";
services.xrdp.openFirewall = true;
}
