{ config, pkgs, ...}:

{

boot = {
  kernelPackages = pkgs.linuxPackages_latest;
  loader.systemd-boot.enable = true;
  loader.efi.canTouchEfiVariables = true;
  
      plymouth = {
        enable = true;
        theme = "abstract_ring";
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



  networking.hostName = "stinkpad"; # Define your hostname.
  hardware.keyboard.qmk.enable = true;
  nix.settings.download-buffer-size = 524288000;

}
