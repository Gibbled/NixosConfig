{ config, pkgs, ...}:

{

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.useTmpfs = true;
  boot.tmp.tmpfsSize = "12G";

  boot.initrd.luks.devices."luks-16dd3b28-2ac7-4ea3-a866-e8b6939020f5".device = "/dev/disk/by-uuid/16dd3b28-2ac7-4ea3-a866-e8b6939020f5";
  networking.hostName = "xybr"; # Define your hostname.
  boot.kernelParams = [
  "video=Card1-DP-1:1920x1080@60"
  "video=Card1-DP-2:1920x1080@60"
  "video=Card1-HDMI-1:1920x1080@60"
  "video=Card1-HDMI-2:1920x1080@60"
  "kernel.dmesg_restrict=0"
];
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



  #All the AMDgpu stuff
  hardware.opengl.emable = true;
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
  #This breaks the build. hope it fixed soon. -v 2024.Q3.2 2024.10.15
  #pkgs.amdvlk
];

}
