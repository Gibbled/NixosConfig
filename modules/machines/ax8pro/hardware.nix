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
    systemd.tmpfiles.rules = 
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];

  environment.systemPackages = with pkgs; [
  clinfo
  lact
  ];

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  hardware.keyboard.qmk.enable = true;
  nix.settings.download-buffer-size = 524288000;
  hardware.graphics.enable = true;


}
