# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ranjit = {
    isNormalUser = true;
    description = "Ranjit";
    uid = 1001;
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoGqlfV2v8FjFAZJLJMhcxaNdriHUY0MffQCsxH2wIn6hiWmxbS/5vWjPyaZs7YJ/ssCywHNnlVD8dZnutboeOjfUtv7VBsUF/c5RX8vASv3fMFSbQ4ZEzbr5m8gd7LFdkyaoBSlN1ePwqDk0wxcleD4ZINKHcaOSJgyGFXt12zRHmGxOrEyamgotqt3oLQHGmTnqj3MQh57Se1raVV1jzvFxTephOL3C0inh/DMaEIc8/YXvXj4t5lwuxj/LNYa8QCNcbxD0d9+E+SXN7TaUyZnC5OSlQBwRjA+uqrev6pfpu3FV2u8T/DUJ/UPSlFn0Y3zGnETCWjkp29K2Iptzh openpgp:0x8FA972DE" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoGqlfV2v8FjFAZJLJMhcxaNdriHUY0MffQCsxH2wIn6hiWmxbS/5vWjPyaZs7YJ/ssCywHNnlVD8dZnutboeOjfUtv7VBsUF/c5RX8vASv3fMFSbQ4ZEzbr5m8gd7LFdkyaoBSlN1ePwqDk0wxcleD4ZINKHcaOSJgyGFXt12zRHmGxOrEyamgotqt3oLQHGmTnqj3MQh57Se1raVV1jzvFxTephOL3C0inh/DMaEIc8/YXvXj4t5lwuxj/LNYa8QCNcbxD0d9+E+SXN7TaUyZnC5OSlQBwRjA+uqrev6pfpu3FV2u8T/DUJ/UPSlFn0Y3zGnETCWjkp29K2Iptzh cardno:000604872437" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQ8Azg+ZQQZroD9EqNJuX+cXG7OHciySliqCxp1B5nCXj5XrZoe/57hR3FoieQ4fi2KlfQk4UXWIiEQceOZ1kbqf0DWNznZ+1Ft1/+qdeq6rsU0NYpeuRZYr8XAiitT2FaMWsVC5eRewjuzpHm0mUjq3bBuRGSmutR9wHpshQ7FrE9Gv13ZyIqRzAzQ2Klos+jR1SvEZhpxJdt4wxXWkCQPlDPYToXqfdIWgneA/juygxA8uxpYHzaSqVfedCudQ+l6HYR96ASYOWHNj666txk+YJ0gdjH2grqlvINC6rQhA7JRjbRTfAdFi0dLw8o7+lUtiTwx+Ptm9OXR2PtJVSt3gc+OBk5NeUs6dCb+W9N0Dyy++M89ASlYfRU/K5x8lUBMyif1fMX/zfT0/bVBrYVOpccUiKvOwPbqz70FSPugyrrC8pQcCA/O15fJV+p15MIDNMtFDQII5P910jvNUeVLRtE/A7gW34GmgLJ9s9yTkWNEaRtayrp1gP6+RII1Ak= ranjit@jukebox" ];
    packages = with pkgs; [
    ##  thunderbird
    gcc
    ];
  };

#Allow the wheel group to not use a password for sudo
security.sudo.wheelNeedsPassword = false;


  #All the AMDgpu stuff
  #hardware.opengl = {
  #driSupport = true;
  #driSupport32Bit = true;
  #};
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
  pkgs.amdvlk
];

#This is for Remote Desktop config

services.xrdp.enable = true;
services.xrdp.defaultWindowManager = "startplasma-wayland";
services.xrdp.openFirewall = true;

  #This is for neovim. 
  # Global Configuration
programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  configure = {
    customRC = ''
      set number
      set list
      set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
      #if &diff
        #colorscheme blue
      #endif
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ ctrlp ];
    };
  };
};
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #Enable Docker
  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  pkgs.lact
  pkgs.neovim
  pkgs.lsb-release
  pkgs.usbutils
  pkgs.pciutils
  pkgs.wget
  pkgs.luajitPackages.luarocks-nix
  pkgs.texliveFull
  pkgs.hack-font
  pkgs.openssh
  pkgs.ccache
  pkgs.tmux
  pkgs.stow
  pkgs.git
  pkgs.lua
  pkgs.ripgrep 
  pkgs.fd 
  pkgs.neofetch 
  pkgs.tree-sitter 
  pkgs.jq
  pkgs.neofetch
  pkgs.pandoc
  pkgs.zotero
  pkgs.kitty
  pkgs.pass
  pkgs.nodejs
  pkgs.blender-hip
  pkgs.blender
  pkgs.btop
  pkgs.kicad
  pkgs.virt-manager
  pkgs.virt-manager-qt
  pkgs.docker
  pkgs.usbutils


  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "ranjit" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";

    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
