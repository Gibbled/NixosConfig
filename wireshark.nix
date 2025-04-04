{ config, pkgs, ... }:

{
programs.wireshark.enable = true;

programs.wireshark.dumpcap.enable = true;

programs.wireshark.usbmon.enable = true;

users.groups.wireshark.members = ["ranjit"];


}

