{ config, pkgs, ... }:

{
programs.virt-manager.enable = true;
users.groups.libvirtd.members = ["ranjit"];
virtualisation.spiceUSBRedirection.enable = true;

virtualisation.libvirtd = {
  enable = true;
  qemu.vhostUserPackages = with pkgs; [ virtiofsd dnsmasq ];
  onBoot = "start";
  qemu.ovmf.enable = true;
  allowedBridges = [
    "virbr0"
  ];

};

}

