{ config, pkgs, ...}:

{

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #This is temporary because 6.13.2 gives an oops when rebuilding the system
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.tmp.useTmpfs = true;
  #boot.tmp.tmpfsSize = "32G";

  networking.hostName = "stinkpad"; # Define your hostname.
  hardware.keyboard.qmk.enable = true;
  nix.settings.download-buffer-size = 524288000;

}
