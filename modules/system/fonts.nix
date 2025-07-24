{config, pkgs, ...}:

{
fonts.packages = with pkgs; [

  nerd-fonts.hack
  nerd-fonts.dejavu-sans-mono
  nerd-fonts.cousine
  nerd-fonts.blex-mono
  open-sans
  noto-fonts-color-emoji
  noto-fonts-emoji
  hack-font
];
}
