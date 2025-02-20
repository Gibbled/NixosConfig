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
  neofetch
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
  mpv
  killall
  alejandra
  privoxy	
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


              nixpkgs.config.permittedInsecurePackages = [
                "olm-3.2.16"
              ];


}
