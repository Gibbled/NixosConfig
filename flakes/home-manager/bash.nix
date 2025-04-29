{ config, pkgs, ... }:

{

  programs.bash = {
      enable = true;
      enableCompletion = true;
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
      cleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage --delete-old";
      #dmesg = "sudo dmesg";
      epoch = "echo \"obase\=2;`date '+%s'`\" | bc";

      };
    };



}

