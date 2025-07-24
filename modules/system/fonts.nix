{config, pkgs, ...}:

{
fonts.packages = with pkgs; [

  nerd-fonts.hack
  nerd-fonts.dejavu-sans-mono
  nerd-fonts.cousine
  nerd-fonts.blex-mono
  open-sans
];
}
