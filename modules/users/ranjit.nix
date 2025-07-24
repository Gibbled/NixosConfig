{config, pkgs, lib, systemSettings, userSettings, ... }:
{

  users.mutableUsers = false;
  users.users.ranjit = {

  isNormalUser = true;
  hashedPasswordFile = config.sops.secrets.ranjit-password.path;
  description = "Ranjit";
  uid = 1001;
  extraGroups = [ "networkmanager" "wheel" "docker" "video" "lp" "dialout" "tor"  "kvm" "libvirt" "usb" "input" "lpadmin" "plugdev" "pcap" "pipewire" "sddm" "crontab" "wireshark" "qemu-libvirtd"];

  };
  }
