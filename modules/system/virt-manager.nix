{ config, pkgs, ... }:

{
programs.virt-manager.enable = true;
users.groups.libvirtd.members = ["ranjit"];
virtualisation.spiceUSBRedirection.enable = true;

#virtualisation.libvirtd = {
  #enable = true;
  #qemu.vhostUserPackages = with pkgs; [ virtiofsd dnsmasq ];
  #onBoot = "start";
  ##this option not valid anymore 20251004
  ##qemu.ovmf.enable = true;
  #allowedBridges = [
    #"virbr0"
  #];

#};
virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    #ovmf = {
      #enable = true;
      #packages = [(pkgs.OVMF.override {
        #secureBoot = true;
        #tpmSupport = true;
      #}).fd];
    #};
  };
};


}

