{ config, pkgs, ...}:

{

  # Bootloader.
  boot = {
  kernelPackages = pkgs.linuxPackages_latest;
  loader.systemd-boot.enable = true;
  loader.efi.canTouchEfiVariables = true;


    plymouth = {
      enable = true;
      theme = "cyanide";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ 
	  "rings" 
	  "abstract_ring" 
	  "cyanide"
	  "glitch"
	  "glowing"
	  ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

  };



  networking.hostName = "xybr"; # Define your hostname.
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
