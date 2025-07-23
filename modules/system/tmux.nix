{ config, pkgs, ... }: 

 {

programs.tmux = {
  enable = true;
  
};

environment.systemPackages = with pkgs; [
  tmuxPlugins.vim-tmux-navigator
  tmuxPlugins.tmux-fzf
  tmuxPlugins.tokyo-night-tmux
  tmuxPlugins.tmux-powerline
  tmuxPlugins.yank
];
}
