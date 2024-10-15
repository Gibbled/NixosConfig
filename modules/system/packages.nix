{ config, pkgs , ... }:

{

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
  pkgs.btop
  pkgs.kicad
  pkgs.virt-manager
  pkgs.virt-manager-qt
  pkgs.docker
  pkgs.usbutils
  pkgs.mpv
  pkgs.killall
  #Might not need this but amdvulkan was failing because it couln't find it. 
  #Remove when no longer needed
  pkgs.libffi
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


}
