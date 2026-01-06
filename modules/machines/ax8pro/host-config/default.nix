{
  config,
  pkgs,
  specialArgs,
  ...
}: {
  imports = [
    #./ollama.nix
    ./ddclient.nix
    ./smartd.nix
    ./packages.nix
    ./wireguard.nix
    ./sops.nix
    ./locale.nix
  ];
}
