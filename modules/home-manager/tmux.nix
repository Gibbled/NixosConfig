{ config, pkgs, lib, ... }:

{
  options = {
    tmux-program.enable =
    lib.mkEnableOption "enables tmux for the shell";
  };


  config = lib.mkIf config.tmux-program.enable {


      programs.tmux = {
        enable = true;
	package = pkgs.tmux;
	plugins = with pkgs; [
	  pkgs.tmuxPlugins.tokyo-night-tmux
	  pkgs.tmuxPlugins.vim-tmux-navigator
	  pkgs.tmuxPlugins.yank
	  pkgs.tmuxPlugins.tmux-fzf
	  ];
	extraConfig = ''
          bind -n M-H previous-window
          bind -n M-L next-window
          unbind C-b 
          set -g prefix C-Space
          bind C-Space send-prefix
          set -g @plugin 'tmux-plugins/tpm'
          set -g @plugin 'tmux-plugins/tmux-sensible'
          set -g @plugin 'christoomey/vim-tmux-navigator'
          set -g mouse on
          set -g @plugin 'erikw/tmux-powerline'
          set -g @plugin "janoamaral/tokyo-night-tmux"
          set -g @plugin "tmux-plugins/tmux-yank"	
          set -g @plugin "sainnhe/tmux-fzf"
          set-option -g allow-rename off
          unbind %
          unbind '"'
          unbind r 
          bind f split-window -v -c "#{pane_current_path}"
          bind r split-window -h -c "#{pane_current_path}"
          TMUX_FZF_LAUNCH_KEY="C-f"
          set -g mode-keys vi
          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
          set-option -sa terminal-overrides ',xterm-256color:Tc'
          unbind e 
          bind e source-file ~/.config/tmux/tmux.conf
          bind -r j resize-pane -D 5
          bind -r k resize-pane -U 5
          bind -r l resize-pane -R 5
          bind -r h resize-pane -L 5
          bind -r m resize-pane -Z
          #set -g status-position top
          run '~/.config/tmux/plugins/tpm/tpm'
          '';
	

	
        };





};
}







