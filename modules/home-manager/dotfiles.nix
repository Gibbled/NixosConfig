{ config, pkgs, ... }:

{

home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;
home.file.".config/kitty/current-theme.conf".source = ./dotfiles/kitty/current-theme.conf;

home.file.".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
home.file.".config/nvim/after/plugin/colours.lua".source = ./dotfiles/nvim/after/plugin/colours.lua;
home.file.".config/nvim/after/plugin/fugitive.lua".source = ./dotfiles/nvim/after/plugin/fugitive.lua;
home.file.".config/nvim/after/plugin/harpoon.lua".source = ./dotfiles/nvim/after/plugin/harpoon.lua;
home.file.".config/nvim/after/plugin/lsp.lua".source = ./dotfiles/nvim/after/plugin/lsp.lua;
home.file.".config/nvim/after/plugin/lualine.lua".source = ./dotfiles/nvim/after/plugin/lualine.lua;
home.file.".config/nvim/after/plugin/mason.lua".source = ./dotfiles/nvim/after/plugin/mason.lua;
home.file.".config/nvim/after/plugin/nvim-tree.lua".source = ./dotfiles/nvim/after/plugin/nvim-tree.lua;
home.file.".config/nvim/after/plugin/ollama.lua".source = ./dotfiles/nvim/after/plugin/ollama.lua;
home.file.".config/nvim/after/plugin/telescope.lua".source = ./dotfiles/nvim/after/plugin/telescope.lua;
home.file.".config/nvim/after/plugin/undotree.lua".source = ./dotfiles/nvim/after/plugin/undotree.lua;
home.file.".config/nvim/after/plugin/noice.lua".source = ./dotfiles/nvim/after/plugin/noice.lua;
home.file.".config/nvim/lua/ranjit/init.lua".source = ./dotfiles/nvim/lua/ranjit/init.lua;
home.file.".config/nvim/lua/ranjit/packer.lua".source = ./dotfiles/nvim/lua/ranjit/packer.lua;
home.file.".config/nvim/lua/ranjit/remap.lua".source = ./dotfiles/nvim/lua/ranjit/remap.lua;
home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
home.file.".ssh/authorized_keys".source = ./dotfiles/ssh/authorized_keys;
home.file.".config/tmux/tmux.conf".source = ./dotfiles/tmux/tmux.conf;
#home.file.".config/tmux/plugins/tpm".source = ./dotfiles/tmux/plugins/tpm;

## Hyprland ##

home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/config/hyprland.conf;
home.file.".config/hypr/start.sh".source = ./dotfiles/hyprland/config/start.sh;

##############


}

