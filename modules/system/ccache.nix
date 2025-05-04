{ config, pkgs, ... }:

{

programs.ccache.enable = true;

nix.settings.extra-sandbox-paths = [ config.programs.ccache.cacheDir ];

nixpkgs.overlays = [
  (self: super: {
    ccacheWrapper = super.ccacheWrapper.override {
      extraConfig = ''
        export CCACHE_COMPRESS=1
        export CCACHE_DIR="${config.programs.ccache.cacheDir}"
        export CCACHE_UMASK=077
        if [ ! -d "$CCACHE_DIR" ]; then
          echo "====="
          echo "Directory '$CCACHE_DIR' does not exist"
          echo "Please create it with:"
          echo "  sudo mkdir -m0770 '$CCACHE_DIR'"
          echo "  sudo chown root:nixbld '$CCACHE_DIR'"
          echo "====="
          exit 1
        fi
        if [ ! -w "$CCACHE_DIR" ]; then
          echo "====="
          echo "Directory '$CCACHE_DIR' is not accessible for user $(whoami)"
          echo "Please verify its access permissions"
          echo "====="
          exit 1
        fi
      '';
    };
  })

];

programs.ccache.packageNames = [ #"qtcore" 
				 "libreoffice" 
				 "octave" 
				 "freecad" 
				 "openscad"  
				 #"ffmpeg-full"  
				 "chromium"  
				 "kicad"  
				 #"kdenlive"  
				 #"ollama"  
				 #"qemu"  
				 #"virt-manager"  
				 "docker"  
				 #"privoxy"  
				 #"wireshark"  
				 #"searx-ng"  
				 #"tor-browser"  
				 #"neovim"  
				 "gnupg"  
				 #"age"  
				 #"vial"  
				 #"via"  
				 #"qmk"  
				 #"mpv"  
				 # "vlc"  
				 #"gcc"  
				 #"llvm"  
				 #"filezilla"  
				 #"meshlab"  
				 #"inkscape"  
				 #"blender-hip"  
				 #"btop-rocm"  
				 "ardour"  
				 #"qjackctl"  
				 ];

}
