{ config, pkgs, ...}:

{

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "stinkpad"; # Define your hostname.
  hardware.keyboard.qmk.enable = true;
  nix.settings.download-buffer-size = 524288000;

}
