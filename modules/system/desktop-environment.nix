{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  services.displayManager.sddm = {

  wayland.enable = true;
  settings.General.DisplayServer = "wayland";
  settings.Theme.ThemeDir = "/run/current-system/sw/share/sddm/themes";
  enable = true;
  theme = "sddm-astronaut-theme";

  };
  #services.displayManager.sddm.wayland.enable = true;
  #services.displayManager.sddm.settings.General.DisplayServer = "wayland";
  #services.displayManager.sddm.settings.Theme.ThemeDir = "/run/current-system/sw/share/sddm/themes";
  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm.theme = "sddm-astronaut-theme";

  services.desktopManager.plasma6.enable = true;

  #This should make gtk apps look less shitty
  programs.dconf.enable = true;


  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #konsole
  kontact
  oxygen
  kate
];

  # environment.sessionVariables = {
   # QT_STYLE_OVERRIDE = "Utterly-Round";
    #QT_GLOBAL_THEME_OVERRIDE = "Kvantum";
    #QT_WINDOW_DECORATIONS_OVERRIDE = "Sweet-Dark-transparent";
#  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

#Allow X programs to work in Wayland
programs.xwayland.enable = true;

#Allow the wheel group to not use a password for sudo
#security.sudo.wheelNeedsPassword = false;
#Yubikeys working now, so switch password back on.
security.sudo.wheelNeedsPassword = true;


environment.systemPackages = with pkgs;
  [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
];
nixpkgs.config.qt5 = {
  enable = true;
  platformTheme = "qt5ct"; 
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
};
}
