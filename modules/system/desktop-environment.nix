{
  config,
  pkgs,
  lib,
  ...
}: {
  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
      insertNameservers = [
	"1.1.1.1"
        "8.8.8.8"
      ];
    };
  };

  location.provider = "geoclue2";

  services = {
    automatic-timezoned = {
      enable = true;
    };
    geoclue2 = {
      enable = true;
      enableDemoAgent = lib.mkForce true;
      geoProviderUrl = "https://beacondb.net/v1/geolocate";
    };
    avahi = {
      enable = true;
      publish.enable = true;
      publish.domain = true;
      openFirewall = true;
      ipv4 = true;
      hostName = config.networking.hostName;
    };
    tzupdate = {
      enable = true;
    };
    gnome = {
      gnome-browser-connector.enable = true;
      at-spi2-core.enable = lib.mkForce false;
    };
    desktopManager = {
      plasma6.enable = true;
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        settings.General.DisplayServer = "wayland";
        settings.Theme.ThemeDir = "/run/current-system/sw/share/sddm/themes";
        theme = "sddm-astronaut-theme";
      };
    };

    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  #Lets have a look at hyprland
  programs.hyprland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    #xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    kdePackages.xdg-desktop-portal-kde
  ];

  ######End of Hyprland Config#####
  #################################
  #This should make gtk apps look less shitty
  programs.dconf.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    kontact
    oxygen
    kate
  ];


  #Allow X programs to work in Wayland
  programs.xwayland = {
    enable = true;
  };

  security = {
    #Allow the wheel group to not use a password for sudo
    #security.sudo.wheelNeedsPassword = false;
    #Yubikeys working now, so switch password back on.
    sudo.wheelNeedsPassword = true;
    ##For hyprlock to be able to unlock as well as lock
    pam.services.hyprlock = {};
    rtkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
  ];

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
