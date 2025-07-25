{ config, pkgs, ... }:

{


  home.packages = with pkgs; [
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
    #Home-manager
    home-manager
    
    wl-clipboard
    gcc
    luajitPackages.jsregexp
    luajitPackages.luarocks-nix
    rustup
    kicad
    #darktable
    freecad
    openscad

    filezilla

    obs-studio
    octaveFull
    nodejs
    libreoffice
    kdePackages.kdenlive
    zotero
    yt-dlp
    #gimp
    gimp3-with-plugins
    inkscape
    meshlab

    ardour
    qjackctl
    orca-slicer
    ollama

    tor-browser
    chromium
    librewolf-bin
    signal-desktop-bin
    session-desktop
    zapzap
    #whatsie
    #nheko
    #neochat

    plover.dev
    vial
    via
    #qmk
    qmk-udev-rules
    qmk_hid
    keymapviz
    #streamcontroller

    calibre

    #For KDE Theming
    kdePackages.qtstyleplugin-kvantum
    catppuccin-kvantum
    utterly-round-plasma-style

    #For Tmux themes
    tmuxPlugins.tokyo-night-tmux

    #For Arduino
    arduino

    vlc
    mpv
    youtube-music
    
    ffmpeg-full
    
    kdePackages.marble

    keepassxc
    git-credential-keepassxc

    bibata-cursors



  ];



}

