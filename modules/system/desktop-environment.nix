{
  config,
  pkgs,
  ...
}: {
  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
      insertNameservers = [
        "8.8.8.8"
      ];
    };
  };

  services = {
    gnome = {
      gnome-browser-connector.enable = true;
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
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
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

  #  environment.sessionVariables = {
  #QT_STYLE_OVERRIDE = "Utterly-Round";
  #QT_GLOBAL_THEME_OVERRIDE = "Kvantum";
  #QT_WINDOW_DECORATIONS_OVERRIDE = "Sweet-Dark-transparent";
  #};

  # Configure keymap in X11

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
    #libsForQt5.qtstyleplugin-kvantum
    #libsForQt5.qt5ct
  ];
  #nixpkgs.config.qt5 = {
  #enable = false;
  #platformTheme = "qt5ct";
  #style = {
  #package = pkgs.utterly-nord-plasma;
  #name = "Utterly Nord Plasma";
  #};
  #};

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
