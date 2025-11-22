{
  config,
  pkgs,
  ...
}: {
  #Fix problems with binaries that require standard lfs
  #allegedly

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    #Missing libraries go here
  ];
}
