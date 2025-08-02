{ config, pkgs, specialArgs, ...}:

{


imports = [
./home.nix
./firefox.nix
./sops.nix
./git.nix
./starship.nix
./bash.nix
./home-packages.nix
./nvim.nix
./dotfiles.nix
./fonts.nix
./hyprland.nix
./rofi.nix
./hyprlock.nix
./tmux.nix
./keepassxc.nix
./nix-colors.nix
./alacritty.nix
./hyprpaper.nix
./hyprlock.nix
./waybar.nix
];


}
