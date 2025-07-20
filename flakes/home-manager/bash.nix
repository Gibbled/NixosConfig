{ config, pkgs, ... }:

{

  programs.bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
      PATH="$HOME/.local/bin:$PATH:$HOME/bin"
      export LESS="-X"
      PAGER=less LESS=R
      clear && `which nitch`
      export GDK_DPI_SCALE="2"
      export NIXPKGS_ALLOW_UNFREE=1
      '';

      shellAliases = {
      vi = "nvim";
      gc = "git commit -a -m $1";
      upd = "sudo nix-channel --update && sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --upgrade |& nom";
      cleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage --delete-old";
      epoch = "echo \"obase\=2;`date '+%s'`\" | bc";
      gnr = "ssh -i /home/ranjit/.ssh/id_noringu_ecdsa -p 2525 'ranjit@gragnet.dyndns.org'";
      grr = "ssh -i /home/ranjit/.ssh/id_ringu_ecdsa -p 2525 'ranjit@gragnet.dyndns.org'";
      bootclean = "sudo nixos-rebuild boot"; 
      fullclean = "cleanup&&bootclean";

      };
    };



}

