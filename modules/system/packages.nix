{ config, pkgs , ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;  [
  lact
  neovim
  lsb-release
  usbutils
  pciutils
  wget
  fwupd
  luajitPackages.luarocks-nix
  texliveFull
  hack-font
  openssh
  #ccache
  #ccacheStdenv
  #ccacheWrapper
  tmux
  stow
  git
  gh
  lua
  ripgrep
  fd
  neofetch
  tree-sitter
  jq
  pandoc
  zotero
  kitty
  pass
  nodejs
  btop-rocm
  virt-manager
  virt-manager-qt
  qemu
  docker
  docker-compose
  usbutils
  killall
  alejandra
  privoxy	
  #firefox-bin
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
  yubikey-personalization-gui
  yubikey-touch-detector 
  age-plugin-yubikey
  piv-agent
  yubico-piv-tool
  pam_u2f


  smartmontools

  inetutils
  dunst
  ];

  # Install firefox.
  #programs.firefox-bin.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


          #    nixpkgs.config.permittedInsecurePackages = [
          #      "olm-3.2.16"
          #    ];


}
