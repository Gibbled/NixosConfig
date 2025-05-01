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
  ccache
  tmux
  stow
  git
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
  btop
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

  smartmontools
  ];

  # Install firefox.
  #programs.firefox-bin.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


          #    nixpkgs.config.permittedInsecurePackages = [
          #      "olm-3.2.16"
          #    ];


}
