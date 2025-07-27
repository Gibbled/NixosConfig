{ config, pkgs, ... }:

{

 # starship - an customizable prompt for any shell
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = false;
      };
    };



}

