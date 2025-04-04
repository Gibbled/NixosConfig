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

  networking.hostName = "xybr"; # Define your hostname.
#  boot.kernelParams = [
#  "video=Card1-DP-1:1920x1080@60"
#  "video=Card1-DP-2:1920x1080@60"
#  "video=Card1-HDMI-1:1920x1080@60"
#  "video=Card1-HDMI-2:1920x1080@60"
#];

  #All the AMDgpu stuff
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
  amdvlk
];
environment.systemPackages = with pkgs; [
  clinfo
];


  systemd.packages = with pkgs; [ lact ];

  systemd.services.lactd.wantedBy = ["multi-user.target"];
  hardware.keyboard.qmk.enable = true;

}
