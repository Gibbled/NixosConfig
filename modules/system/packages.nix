{ confi, pkgs , ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;  [
  lact
  neovim
  nixd
  lsb-release
  usbutils
  pciutils
  wget
  fwupd
  luajitPackages.luarocks-nix
  #texliveFull
  openssh
  #ccache
  #ccacheStdenv
  #ccacheWrapper
  tmux
  stow
  dysk
  git
  gh
  lua
  ripgrep
  fd
  fastfetch
  tree-sitter
  jq
  pandoc
  zotero
  alacritty
  pass
  nodejs
  qemu
  docker
  docker-compose
  usbutils
  killall
  alejandra
  privoxy	
  bc
  wireshark
  wireguard-tools
  wg-netmanager
  sops
  ssh-to-age
  age
  yubioath-flutter
  yubikey-manager
  yubikey-personalization
  yubikey-touch-detector 
  age-plugin-yubikey
  piv-agent
  yubico-piv-tool
  pam_u2f
  smartmontools
  inetutils
  espeak
  python3
  vimPlugins.mini-base16
  vimPlugins.base16-nvim
  pkgs.bibata-cursors
  #gpsbabel-gui
  #gpsbabel
  sddm-astronaut
  kdePackages.qtmultimedia
  #kdePackages.plasma-browser-integration
  #kdePackages.xdg-desktop-portal-kde
  #utterly-round-plasma-style
  ntopng
  redis

  #Hyprland
  waybar
  dunst
  libnotify
  swww
  #rofi-wayland
  hyprlock
  pulseaudio


  #timezone stuff
  localtime
  geoclue2

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  virtualisation.waydroid.enable = true;

  #linkwarden-server.enable = true;

}
