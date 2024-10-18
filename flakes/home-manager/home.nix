{ config, pkgs,  ... }:

{
  home.username = "ranjit";
  home.homeDirectory = "/home/ranjit";
  imports = [
  #  inputs.nix-colors.homeManagerModules.default
  ./ranjit.nix
  ];

  xresources.properties = {
    "Xcursor.size" = 20;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    neofetch
    # archives
    zip
    xz
    unzip
    p7zip
    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder
    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    # nix related
    nix-output-monitor
    # productivity
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files
    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Gibbled";
    userEmail = "lucksack@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
    PATH="$HOME/.local/bin:$PATH:$HOME/bin"
    export LESS="-X"
    PAGER=less LESS=R
    clear && `which neofetch`
    '';

    shellAliases = {
    vi = "nvim";
    gc = "git commit -a -m $1";
    sgp = "sudo git pull";
    upd = "sudo nix-channel --update && sudo nix flake update";
    rebuild = "sudo nixos-rebuild switch --upgrade |& nom";

    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
